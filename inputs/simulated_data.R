---
title: "Simulated data for prime minister lifespan"
author: "Mary Cheng"
purpose: "Simulate data on information about how long prime ministers of Australia lived."
---

```{r}
#| message: FALSE
#| echo: FALSE
# Load necessary libraries

library(tidyverse)
library(babynames)
library(janitor)
library(knitr)
```

```{r}
#| message: FALSE
#| echo: FALSE
# Simulate data:
# create a table that has 4 columns: name, birth year, death year, and year lived.

# I used package called babynames for simulated data
# For birth year, I assume they were born between 1800 to 1950. Assume that they lived between 60 to 100 years.
set.seed(853)

simulated_dataset <-
  tibble(
    prime_minister = babynames |>
      filter(prop > 0.01) |>
      distinct(name) |>
      unlist() |>
      sample(size = 10, replace = FALSE),
    birth_year = sample(1800:1950, size = 10, replace = TRUE),
    years_lived = sample(60:100, size = 10, replace = TRUE),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)

simulated_dataset
```
