# could to workflowset with each downsample out and in method, then one with both
# workflowset experiment with downsampleing in the cross validaiton or in the rf fit
rec <- train %>%
  recipe() %>%
  update_role(starts_with('bio'), new_role = 'predictor') %>%
  update_role(rufip, new_role = 'outcome') %>%
  update_role(ANL12_ID, new_role = 'id') %>%
  step_bin2factor(all_outcomes()) %>%
  step_rm(!has_role(c('predictor', 'outcome', 'id'))) #

rec_down1 <- rec %>%
  step_downsample(all_outcomes(), skip = TRUE, under_ratio = 1)


rec_down10 <- rec %>%
  step_downsample(all_outcomes(), skip = TRUE, under_ratio = 10)


rf_mod <- rand_forest(mode = 'classification') %>%
  set_engine('ranger')

rf_mod_ds <- rand_forest(mode = 'classification') %>%
  set_engine('ranger', sample.fraction = c(occ_ratio, occ_ratio))


recipes <- list(norm = rec, down1 = rec_down1, down10 = rec_down10)
models <- list(norm = rf_mod, ds = rf_mod_ds)

wflw_set <- workflow_set(recipes, models)

registerDoMC(cores = available_cores)

tuning <- workflow_map(wflw_set, 'fit_resamples', resamples = folds, metrics = c_metrics)
registerDoSEQ()
##########

res <- fit_resamples(wflw, folds, metrics = c_metrics)
res_rf <- rand_forest(mode = 'classification',
                      trees = 500) %>%
  set_engine('ranger', splitrule = 'hellinger') %>%
  workflow(rec, .) %>%
  fit_resamples(folds, metrics = c_metrics)

res_rf2 <- rand_forest(mode = 'classification',
                       trees = 500) %>%
  set_engine('ranger') %>%
  workflow(rec, .) %>%
  fit_resamples(folds, metrics = c_metrics)

res_rf3 <- rand_forest(mode = 'classification',
                       trees = 500) %>%
  set_engine('ranger', splitrule = 'hellinger', max.depth = 4) %>%
  workflow(rec, .) %>%
  fit_resamples(folds, metrics = c_metrics)

res_rf4 <- rand_forest(mode = 'classification',
                       trees = 500) %>%
  set_engine('ranger', sample.fraction = c(.003493315, 0.003493315)) %>%
  workflow(rec, .) %>%
  fit_resamples(folds, metrics = c_metrics)

collect_metrics(res)
collect_metrics(res_rf)
collect_metrics(res_rf2)
collect_metrics(res_rf3)
collect_metrics(res_rf4)
collect_metrics(res_rf5)


testi <- prep(rec) %>% juice
testi$rufip %>% summary


# count the number of inbag samples
inbag <-
  rand_forest(mode = 'classification',
              trees = 500) %>%
  set_engine('ranger', sample.fraction = c(0.003493315, .01)) %>%
  fit(rufip ~ ., data = testi %>% select(-ANL12_ID)) %>%
  extract_fit_engine() %>%
  .$inbag.counts %>%
  do.call(cbind, .)


colSums(inbag[testi$rufip == "yes", ]) # floor(0.01*150) = 1
colSums(inbag[testi$rufip == "no", ]) # floor(0.1*150) = 15

# case weights for random forest
885/253341
table(testi$rufip)
prop.table(table(testi$rufip))
prNum <- table(testi$rufip)[1] # number of presences
bgNum <- table(testi$rufip)[2] # number of backgrounds
casewts <- ifelse(testi$rufip == 'yes', 1, prNum / bgNum)
