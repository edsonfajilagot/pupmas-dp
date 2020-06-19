input <- if(file.exists("flights14.csv")){
  "flights14.csv"
} else {
  "https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv"
}

flights <- fread(input)
flights
dim(flights)

# Creating data table
DT <- data.table(
  ID = c("b","b","b","a","a","c"),
  a = 1:6,
  b = 7:12,
  c = 13:18
)
DT
class(DT$ID)

ans <- flights[origin == "JFK" & month == 6L,]
View(head(ans))
ans <- flights[, .(arr_delay, dest)]
ans2 <- flights[, c("arr_delay", "dest")]

# How many trips have been made in 2014 from "JFK" airport in the month of June?
flights[origin=="JFK" & month==6L, length(dest)]
flights[origin=="JFK" & month==6L, .N]


ans <- flights[carrier == "AA", .N, by=.(origin, dest)]
ans <- flights[carrier == "AA", .N, by=.(origin, dest)][order(origin, -dest)]




















# Get all flights with "JFK" as the origin airport in the month of june
ans <- flights[origin=="JFK" & month==6L]
flights[1:2] #getting first 2 rows

ans <- flights[order(-origin)]
ans <- flights[,.(origin, dest, carrier)]
ans <- flights[, !(month:carrier)] # except
ans <- flights[, origin] # returns a vector
ans <- flights[, .(arr_delay, dep_delay)]
ans <- flights[, .(delay_arr=arr_delay, delay_dep=dep_delay)]

ans <- flights[arr_delay + dep_delay < 0, .N]
ans <- flights[origin=="JFK" & month==6L, .(m_arr=mean(arr_delay), m_dep=mean(dep_delay))]

ans <- flights[origin=="JFK" & month==6L, .N]
ans <- flights[origin=="JFK" & month==6L, .(count=.N)]

# select columns in dataframe way
ans <- flights[, c("arr_delay", "dep_delay")]
select_cols <- c("arr_delay", "dep_delay")
ans <- flights[, ..select_cols]
ans <- flights[, select_cols, with=FALSE]

ans <- flights[, !c("arr_delay", "dep_delay")]

ans <- flights[, !c("year", "month")]

ans <- flights[, .(trips=.N), by=origin]
ans <- flights[, .(trips=.N), by=.(origin)]
ans <- flights[, .(trips=.N), by=.(origin, dest)]

ans <- flights[carrier=="AA", .(trips=.N), by=.(origin)]
ans <- flights[carrier=="AA", .(trips=.N), by=.(origin, dest)]

ans <- flights[carrier=="AA", .(m_arr=mean(arr_delay), m_dep=mean(dep_delay)), by=month]

ans <- flights[carrier=="AA", .N, by=.(origin, dest)][order(origin, -dest)]
ans <- flights[, .N, by = .(dep_delay > 0, arr_delay > 0)]

ans <- flights[dep_delay > 0 & arr_delay <= 0, .N]


DT[, lapply(.SD, mean), by=ID]


ans <- flights[, ':='(speed = distance / (air_time / 60),
                      delay = arr_delay + dep_delay
                      )]
