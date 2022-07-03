library(dplyr)
library(highcharter)

set.seed(2022)
options(dplyr.summarise.inform = FALSE)

county <- sort(rep(c("Nyeri", "Murang'a"), 20))
year <- rep(2001:2020, 2)
value <- sample(45:9854, 40)

df <- data.frame(county, year, value)

kwanza_graph_function <- function(type){

if(type == "mobile"){
  dynamic_size = "10px"
  title_size = "14px"
}else
  dynamic_size = "18px"
  title_size = "18px"

kwanza_graph <- df %>%
    hchart('line', highcharter::hcaes(x = 'year', y = "value", group = "county")
    )%>% 
  hc_colors(c("#e43057", "black")) %>% 
  hc_yAxis(title = list(text = ""),
                        labels = list(style = 
                                        list(fontSize = dynamic_size))
  ) %>% 
  hc_xAxis(title = list(text = ""),
                        labels = list(style = 
                                        list(fontSize = dynamic_size))
  ) %>% 
  hc_title (text = "This is dummy output",
                         align = "left", 
                               margin= 50,
                         style = list(fontSize = title_size, 
                                      fontWeight = 'bold')) %>%
  highcharter::hc_caption(
    text = "Source: Dummy Data",
    style = list(fontSize = dynamic_size)
  ) %>% 
  hc_tooltip(backgroundColor = '#fff',
                          borderColor = '#fff',
                          borderRadius =  3,
                          style = list (
                            fontWeight = 'bold'
                          )) %>% 
  highcharter::hc_exporting(
    enabled = TRUE,
    filename = "kwanza_graph.png",
    dataLabels = list(enabled = TRUE)
  )


tab1 <- df %>% 
        group_by(county, year) %>% 
        summarise(average = mean(value, na.rm = TRUE)) %>% 
        ungroup()

colnames(tab1) <- c("County", "Year", "Average")

result <- list(kwanza_graph, tab1)

return(result)

}

xvals <- c("This is a very very very long label and I am going to make it even longer", 
           "This is a shorter label but it's still long",
           "Standard maybe")
value <- c(20, 40, 30)

df2 <- data.frame(xvals, value)

tatu_graph_function <- function(type){
  

  if(type == "mobile"){
    dynamic_size = "10px"
    title_size = "14px"
  }else
    dynamic_size = "18px"
  title_size = "18px"
  
  if(type == "mobile"){
    tatu_graph <- df2 %>%
      hchart('bar', highcharter::hcaes(x = 'xvals', y = "value"),
             color = "#e43057")
  }else{
    
    tatu_graph <- df2 %>%
      hchart('column', highcharter::hcaes(x = 'xvals', y = "value"),
             color = "#e43057")
  }
  
  
  tatu_graph <- tatu_graph %>%
    hc_yAxis(title = list(text = ""),
             labels = list(style = 
                             list(fontSize = dynamic_size))
    ) %>% 
    hc_xAxis(title = list(text = ""),
             labels = list(style = 
                             list(fontSize = dynamic_size))
    ) %>% 
    hc_title (text = "Another dummy output",
              align = "left", 
              margin= 50,
              style = list(fontSize = title_size, 
                           fontWeight = 'bold')) %>%
    highcharter::hc_caption(
      text = "Source: Dummy Data",
      style = list(fontSize = dynamic_size)
    ) %>% 
    hc_tooltip(backgroundColor = '#fff',
               borderColor = '#fff',
               borderRadius =  3,
               style = list (
                 fontWeight = 'bold'
               )) %>% 
    highcharter::hc_exporting(
      enabled = TRUE,
      filename = "kwanza_graph.png",
      dataLabels = list(enabled = TRUE)
    )
  
  return(tatu_graph)
}
