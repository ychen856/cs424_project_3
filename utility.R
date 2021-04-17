source("global.R")

getData <- function(area, option, month, bType) {
  print("======= get data start =======")
  print(area)
  print(option)
  print(month)
  print(bType)
  print("======= get data end =======")
  
  #extract area
  area_usage_df <- subset(usage_2010_df, substr(GEOID10, 1, 11) %in% unique(subset(area_tract_mapping_df, tolower(COMMUNITY) == tolower(area))$GEOID10))
  
  #building type
  if(!"All" %in% bType) {
    area_usage_df <- subset(area_usage_df, BUILDING.TYPE %in% bType)
  }
  
  #sum rows by option
  if(nrow(area_usage_df) < 1)
    return ("")
  
  if (option == "Electricity") {
    #pick column by month
    if (month == "January") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.JANUARY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.JANUARY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "February") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.FEBRUARY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.FEBRUARY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "March") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.MARCH.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.MARCH.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "April") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.APRIL.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.APRIL.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "May") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.MAY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.MAY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "June") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.JUNE.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.JUNE.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "July") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.JULY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.JULY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "August") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.AUGUST.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.AUGUST.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "September") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.SEPTEMBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.SEPTEMBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "October") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.OCTOBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.OCTOBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "November") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.NOVEMBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.NOVEMBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "December") {
      area_usage_df <- subset(area_usage_df, !is.na(KWH.DECEMBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$KWH.DECEMBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
    else if (month == "All") {
      area_usage_df <- subset(area_usage_df, !is.na(TOTAL.KWH))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$TOTAL.KWH, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
  }
  else if (option == "Gas") {
    #pick column by month
    if (month == "January") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.JANUARY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.JANUARY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "February") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.FEBRUARY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.FEBRUARY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "March") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.MARCH.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.MARCH.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "April") {
      area_usage_df <- subset(area_usage_df, !is.na(TERM.APRIL.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$TERM.APRIL.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "May") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.MAY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.MAY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "June") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.JUNE.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.JUNE.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "July") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.JULY.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.JULY.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "August") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.AUGUST.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.AUGUST.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "September") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.SEPTEMBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.SEPTEMBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "October") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.OCTOBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.OCTOBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "November") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.NOVEMBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.NOVEMBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "December") {
      area_usage_df <- subset(area_usage_df, !is.na(THERM.DECEMBER.2010))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$THERM.DECEMBER.2010, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=FALSE, na.action=NULL)
    }
    else if (month == "All") {
      area_usage_df <- subset(area_usage_df, !is.na(TOTAL.THERMS))
      print(area_usage_df)
      area_usage_df <- aggregate(area_usage_df$TOTAL.THERMS, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
    }
  }
  else if (option == "Building Type") {
    #print(area_usage_df)
    area_usage_df <- area_usage_df[, c(2:3)]
    area_usage_df <- area_usage_df[!duplicated(area_usage_df), ]
    #print(area_usage_df)
    #area_usage_df_temp <- aggregate(BUILDING.TYPE ~ CENSUS.BLOCK, data = area_usage_df, c)
    #area_usage_df <- rbind(area_usage_df, area_usage_df_temp)
    #print(area_usage_df)
    #near_west_side_type_sum_df <- aggregate(BUILDING.TYPE ~ CENSUS.BLOCK, data = near_west_side_usage_df, c)
  }
  else if (option == "Building Age") {
    area_usage_df <- aggregate(area_usage_df$AVERAGE.BUILDING.AGE, by=list(area_usage_df$CENSUS.BLOCK), FUN=mean, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  }
  else if (option == "Building Height") {
    area_usage_df <- aggregate(area_usage_df$AVERAGE.STORIES, by=list(area_usage_df$CENSUS.BLOCK), FUN=mean, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  }
  else if (option == "Total Population") {
    area_usage_df <- aggregate(area_usage_df$TOTAL.POPULATION, by=list(area_usage_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  }
  
  names(area_usage_df)[1] <- c("GEOID10")
  names(area_usage_df)[2] <- c("AMOUNT")
  print(subset(area_usage_df, GEOID10 == '170318382002018'))
  selected_block_df <- subset(chicago_block_df, substr(GEOID10, 1, 11) %in% unique(subset(area_tract_mapping_df, tolower(COMMUNITY) == tolower(area))$GEOID10))
  
  usage_block_df <- selected_block_df %>% left_join(area_usage_df)
  
  #print(nrow(usage_block_df))
  #print(usage_block_df)
  return (usage_block_df)
}


getPlotData <- function(id) {
  usage_id_df <- subset(usage_2010_df, GEOID10 == id)
  print(usage_id_df)
  if(nrow(usage_id_df) < 1)
    return (NULL)
  
  elec_1 <- aggregate(usage_id_df$KWH.JANUARY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_2 <- aggregate(usage_id_df$KWH.FEBRUARY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_3 <- aggregate(usage_id_df$KWH.MARCH.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_4 <- aggregate(usage_id_df$KWH.APRIL.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_5 <- aggregate(usage_id_df$KWH.MAY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_6 <- aggregate(usage_id_df$KWH.JUNE.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_7 <- aggregate(usage_id_df$KWH.JULY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_8 <- aggregate(usage_id_df$KWH.AUGUST.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_9 <- aggregate(usage_id_df$KWH.SEPTEMBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_10 <- aggregate(usage_id_df$KWH.OCTOBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_11 <- aggregate(usage_id_df$KWH.NOVEMBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  elec_12 <- aggregate(usage_id_df$KWH.DECEMBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  
  gas_1 <- aggregate(usage_id_df$THERM.JANUARY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_2 <- aggregate(usage_id_df$THERM.FEBRUARY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_3 <- aggregate(usage_id_df$THERM.MARCH.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_4 <- aggregate(usage_id_df$TERM.APRIL.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_5 <- aggregate(usage_id_df$THERM.MAY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_6 <- aggregate(usage_id_df$THERM.JUNE.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_7 <- aggregate(usage_id_df$THERM.JULY.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_8 <- aggregate(usage_id_df$THERM.AUGUST.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_9 <- aggregate(usage_id_df$THERM.SEPTEMBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_10 <- aggregate(usage_id_df$THERM.OCTOBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_11 <- aggregate(usage_id_df$THERM.NOVEMBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  gas_12 <- aggregate(usage_id_df$THERM.DECEMBER.2010, by=list(usage_id_df$CENSUS.BLOCK), FUN=sum, keep.names = TRUE, na.rm=TRUE, na.action=NULL)
  
  
  names(elec_1)[1] <- c("GEOID10")
  names(elec_1)[2] <- c("AMOUNT")
  names(elec_2)[1] <- c("GEOID10")
  names(elec_2)[2] <- c("AMOUNT")
  names(elec_3)[1] <- c("GEOID10")
  names(elec_3)[2] <- c("AMOUNT")
  names(elec_4)[1] <- c("GEOID10")
  names(elec_4)[2] <- c("AMOUNT")
  names(elec_5)[1] <- c("GEOID10")
  names(elec_5)[2] <- c("AMOUNT")
  names(elec_6)[1] <- c("GEOID10")
  names(elec_6)[2] <- c("AMOUNT")
  names(elec_7)[1] <- c("GEOID10")
  names(elec_7)[2] <- c("AMOUNT")
  names(elec_8)[1] <- c("GEOID10")
  names(elec_8)[2] <- c("AMOUNT")
  names(elec_9)[1] <- c("GEOID10")
  names(elec_9)[2] <- c("AMOUNT")
  names(elec_10)[1] <- c("GEOID10")
  names(elec_10)[2] <- c("AMOUNT")
  names(elec_11)[1] <- c("GEOID10")
  names(elec_11)[2] <- c("AMOUNT")
  names(elec_12)[1] <- c("GEOID10")
  names(elec_12)[2] <- c("AMOUNT")
  
  
  names(gas_1)[1] <- c("GEOID10")
  names(gas_1)[2] <- c("AMOUNT")
  names(gas_2)[1] <- c("GEOID10")
  names(gas_2)[2] <- c("AMOUNT")
  names(gas_3)[1] <- c("GEOID10")
  names(gas_3)[2] <- c("AMOUNT")
  names(gas_4)[1] <- c("GEOID10")
  names(gas_4)[2] <- c("AMOUNT")
  names(gas_5)[1] <- c("GEOID10")
  names(gas_5)[2] <- c("AMOUNT")
  names(gas_6)[1] <- c("GEOID10")
  names(gas_6)[2] <- c("AMOUNT")
  names(gas_7)[1] <- c("GEOID10")
  names(gas_7)[2] <- c("AMOUNT")
  names(gas_8)[1] <- c("GEOID10")
  names(gas_8)[2] <- c("AMOUNT")
  names(gas_9)[1] <- c("GEOID10")
  names(gas_9)[2] <- c("AMOUNT")
  names(gas_10)[1] <- c("GEOID10")
  names(gas_10)[2] <- c("AMOUNT")
  names(gas_11)[1] <- c("GEOID10")
  names(gas_11)[2] <- c("AMOUNT")
  names(gas_12)[1] <- c("GEOID10")
  names(gas_12)[2] <- c("AMOUNT")
  
  elec_1$CENSUS.BLOCK <- elec_1$GEOID10
  elec_1$SOURCE <- "Electricity"
  elec_1$MONTH <- 1
  
  elec_2$CENSUS.BLOCK <- elec_2$GEOID10
  elec_2$SOURCE <- "Electricity"
  elec_2$MONTH <- 2
  
  elec_3$CENSUS.BLOCK <- elec_2$GEOID10
  elec_3$SOURCE <- "Electricity"
  elec_3$MONTH <- 3
  
  elec_4$CENSUS.BLOCK <- elec_4$GEOID10
  elec_4$SOURCE <- "Electricity"
  elec_4$MONTH <- 4
  
  elec_5$CENSUS.BLOCK <- elec_5$GEOID10
  elec_5$SOURCE <- "Electricity"
  elec_5$MONTH <- 5
  
  elec_6$CENSUS.BLOCK <- elec_6$GEOID10
  elec_6$SOURCE <- "Electricity"
  elec_6$MONTH <- 6
  
  elec_7$CENSUS.BLOCK <- elec_7$GEOID10
  elec_7$SOURCE <- "Electricity"
  elec_7$MONTH <- 7
  
  elec_8$CENSUS.BLOCK <- elec_8$GEOID10
  elec_8$SOURCE <- "Electricity"
  elec_8$MONTH <- 8
  
  elec_9$CENSUS.BLOCK <- elec_9$GEOID10
  elec_9$SOURCE <- "Electricity"
  elec_9$MONTH <- 9
  
  elec_10$CENSUS.BLOCK <- elec_10$GEOID10
  elec_10$SOURCE <- "Electricity"
  elec_10$MONTH <- 10
  
  elec_11$CENSUS.BLOCK <- elec_11$GEOID10
  elec_11$SOURCE <- "Electricity"
  elec_11$MONTH <- 11
  
  elec_12$CENSUS.BLOCK <- elec_12$GEOID10
  elec_12$SOURCE <- "Electricity"
  elec_12$MONTH <- 12
  
  
  gas_1$CENSUS.BLOCK <- gas_1$GEOID10
  gas_1$SOURCE <- "Gas"
  gas_1$MONTH <- 1
  
  gas_2$CENSUS.BLOCK <- gas_2$GEOID10
  gas_2$SOURCE <- "Gas"
  gas_2$MONTH <- 2
  
  gas_3$CENSUS.BLOCK <- gas_2$GEOID10
  gas_3$SOURCE <- "Gas"
  gas_3$MONTH <- 3
  
  gas_4$CENSUS.BLOCK <- gas_4$GEOID10
  gas_4$SOURCE <- "Gas"
  gas_4$MONTH <- 4
  
  gas_5$CENSUS.BLOCK <- gas_5$GEOID10
  gas_5$SOURCE <- "Gas"
  gas_5$MONTH <- 5
  
  gas_6$CENSUS.BLOCK <- gas_6$GEOID10
  gas_6$SOURCE <- "Gas"
  gas_6$MONTH <- 6
  
  gas_7$CENSUS.BLOCK <- gas_7$GEOID10
  gas_7$SOURCE <- "Gas"
  gas_7$MONTH <- 7
  
  gas_8$CENSUS.BLOCK <- gas_8$GEOID10
  gas_8$SOURCE <- "Gas"
  gas_8$MONTH <- 8
  
  gas_9$CENSUS.BLOCK <- gas_9$GEOID10
  gas_9$SOURCE <- "Gas"
  gas_9$MONTH <- 9
  
  gas_10$CENSUS.BLOCK <- gas_10$GEOID10
  gas_10$SOURCE <- "Gas"
  gas_10$MONTH <- 10
  
  gas_11$CENSUS.BLOCK <- gas_11$GEOID10
  gas_11$SOURCE <- "Gas"
  gas_11$MONTH <- 11
  
  gas_12$CENSUS.BLOCK <- gas_12$GEOID10
  gas_12$SOURCE <- "Gas"
  gas_12$MONTH <- 12
  
  
  plot_df <- data.frame(matrix(ncol = 5, nrow = 0))
  plot_col <- c("GEOID10", "AMOUNT", "CENSUS.BLOCK", "SOURCE", "MONTH")
  colnames(plot_df) <- plot_col
  
  plot_df <- rbind(plot_df, elec_1)
  plot_df <- rbind(plot_df, elec_2)
  plot_df <- rbind(plot_df, elec_3)
  plot_df <- rbind(plot_df, elec_4)
  plot_df <- rbind(plot_df, elec_5)
  plot_df <- rbind(plot_df, elec_6)
  plot_df <- rbind(plot_df, elec_7)
  plot_df <- rbind(plot_df, elec_8)
  plot_df <- rbind(plot_df, elec_9)
  plot_df <- rbind(plot_df, elec_10)
  plot_df <- rbind(plot_df, elec_11)
  plot_df <- rbind(plot_df, elec_12)
  
  plot_df <- rbind(plot_df, gas_1)
  plot_df <- rbind(plot_df, gas_2)
  plot_df <- rbind(plot_df, gas_3)
  plot_df <- rbind(plot_df, gas_4)
  plot_df <- rbind(plot_df, gas_5)
  plot_df <- rbind(plot_df, gas_6)
  plot_df <- rbind(plot_df, gas_7)
  plot_df <- rbind(plot_df, gas_8)
  plot_df <- rbind(plot_df, gas_9)
  plot_df <- rbind(plot_df, gas_10)
  plot_df <- rbind(plot_df, gas_11)
  plot_df <- rbind(plot_df, gas_12)
  
  print(plot_df)
  
  return (plot_df)
}


getMaxAmount <- function(df) {
  return (max(df$AMOUNT, na.rm = TRUE))
}