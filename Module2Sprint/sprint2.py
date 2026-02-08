import pandas as pd

books = pd.read_csv('book.csv', sep=';')
authors = pd.read_csv('author.csv', sep=';')
book_author = pd.read_csv('book_author.csv', sep=';')
book_genre = pd.read_csv('book_genre.csv', sep=';')
genres = pd.read_csv('genre.csv', sep=';')
reviews = pd.read_csv('review.csv', sep=';')
translators = pd.read_csv('translator.csv', sep=';')
df = books.merge(reviews, left_on='review_id', right_on='id', suffixes=('', '_rev'))
df = df.merge(book_author, left_on='id', right_on='book_id')
df = df.merge(authors, left_on='author_id', right_on='id', suffixes=('', '_auth'))

print ("This analyzes a database of books I read last year and ranks them according to certain criteria.")

top_authors = df.groupby(['first_name', 'last_name'])['score'].agg(['mean', 'count']).reset_index()
top_authors = top_authors[top_authors['count'] > 1]
top_authors = top_authors.sort_values(by='mean', ascending=False)
top_authors = top_authors.reset_index(drop=True)
top_authors.index = top_authors.index + 1
top_authors = top_authors.rename(columns={'first_name': 'First Name', 'last_name': 'Last Name', 'mean': 'Average Score', 'count': 'Total Books'})
print("\n--- Top Authors (With Multiple Books) ---")
print(top_authors.head(10))

long_books = df.groupby('title')['page_length'].min().reset_index()
long_books = long_books.sort_values(by='page_length', ascending=False)
long_books = long_books.reset_index(drop=True)
long_books.index = long_books.index + 1
print('\n--- Longest Books ---')
print(long_books.head(5))

df = df.merge(book_genre, left_on='book_id', right_on='book_id')
df = df.merge(genres, left_on='genre_id', right_on='id', suffixes=('', '_gen'))

genPop = df.groupby('genre_name').size().reset_index(name='book_count')
genPop = genPop.sort_values(by='book_count', ascending=False).reset_index(drop=True)
genPop = genPop.rename(columns={'genre_name': 'Genre', 'book_count': 'Total Number of Books'})
genPop.index = genPop.index + 1
print("\n--- Most Popular Genres ---")
print(genPop.head(5))