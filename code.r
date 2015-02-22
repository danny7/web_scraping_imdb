# directors
lines <- readLines('http://www.imdb.com/chart/top')
movie_lines <- grep(pattern = '\\s{4, }<a href="/title/tt.*/\\?ref_=.*"', x = lines, value = TRUE)
movie_ab <- sub(pattern = '.*<a href="(/title/tt.*)/\\?ref_=.*"', x = movie_lines, replacement = '\\1')
 directors <- list()
for(movie in movie_ab[1:3]) {
  url <- paste0('http://www.imdb.com/', movie,'/fullcredits')
  line <- readLines(url)
  title_lines <- grep(pattern ='<meta.*property=.*title.*content=".*".*/>', x = line , value = TRUE)
  title <- sub(pattern = '<meta.*property=.*title.*content="(.*)".*/>', x = title_lines, replacement = '\\1' )
  tables = readHTMLTable(url)
  directors[[title]] <- tables[[1]][,1]
}
directors


# cast
cast <- list()
for(movie in movie_ab[1:3]) {
  url <- paste0('http://www.imdb.com/', movie,'/fullcredits')
  line <- readLines(url)
  title_lines <- grep(pattern ='<meta.*property=.*title.*content=".*".*/>', x = line , value = TRUE)
  title <- sub(pattern = '<meta.*property=.*title.*content="(.*)".*/>', x = title_lines, replacement = '\\1' )
  tables = readHTMLTable(url)
  cast[[title]] <- tables[[3]][,2]
}
cast
