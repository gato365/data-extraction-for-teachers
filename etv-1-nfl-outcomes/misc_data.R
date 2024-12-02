


```{r}

## All Football three letter team names
team_names <- c("crd","atl","rav","buf","car","chi","cin","cle","dal","den","det","gnb","htx","clt","jax","kan","sdg","ram","mia","min","nwe","nor","nyg","nyj","rai","phi","pit","sfo","sea","tam","oti","was")

years <- 2013:2023

generic_url <- paste0("https://www.pro-football-reference.com/teams/",team_names[1],"/",years[1],".htm#all_games")

```

```{r}
# Get data from URL
get_pfr_table <- function(url) {
  response <- GET(url,
                  +                 user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"),
                  +                 timeout(20))
  webpage <- read_html(url)
  table <- webpage %>% 
    html_table() %>% 
    .[[1]]  # Usually the main stats table is the first one
  return(table)
}
tmp_df <- get_pfr_table(generic_url)

```