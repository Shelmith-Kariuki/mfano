
source("data_wrangling.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  ## defining the viewport width cutoff
  device_reactive <- reactive({
    
    if(as.numeric(get_width()) <= 480){
      "mobile"
    }
    else{
      "comp"
    }
    
  })
  
    output$kwanza_graph <- renderHighchart({
      kwanza_graph_function(type = device_reactive())[[1]]

    })

    output$pili_graph <- renderHighchart({
      kwanza_graph_function(type = device_reactive())[[1]]
      
    })
    
    output$pili_table <- renderDataTable({
      DT::datatable(kwanza_graph_function(type = device_reactive())[[2]],
                    options = list(
                        dom = 'tp',
                        pageLength = 5,
                        scrollX = "400px"
                      ))
    })

    output$tatu_graph <- renderHighchart({
      tatu_graph_function(type = device_reactive())
    })

})
