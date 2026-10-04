### TEST SCRIPT ----

library(lavaan)

### Model 1 HolzingerSwineford ----

model1 <- "visual =~ x1 + x2 + x3
          textual =~ x4 + x5 + x6
          speed =~ x7 + x8 + x9
          g =~ visual + textual + speed"

m1 <- cfa(model1, HolzingerSwineford1939, meanstructure = T)
summary(m1, fit.measures = T, standardized = T)

#### modification indices ----

mod1 <- as.data.frame(modificationindices(m1))
mod1 <- mod1[order(-mod1$mi), ]
mod1

### Model 2 HolzingerSwineford ----

model2 <- "visual =~ x1 + x2 + x3
          textual =~ x4 + x5 + x6
          speed =~ x7 + x8 + x9
          g =~ visual + textual + speed

          # modifications
          visual =~  x9
          g =~  x9
          visual =~ x7
          g =~  x7"

m2 <- cfa(model2, HolzingerSwineford1939, meanstructure = T)
summary(m2, fit.measures = T, standardized = T)


### Nested model comparison ----

anova(m1,m2) # model 1 without cross-loadings fits significantly worse!
