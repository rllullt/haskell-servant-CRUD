# haskell-servant-CRUD
Haskell CRUD Operations with Servant and SQLite based on the tutorial with the same name by Purely Haskell YouTube Channel

## Database

You must create an SQLite database and store its file in the home directory:

```bash
sqlite3 haskell-servantDB
```


## Running the application

For interactive mode, it can be run with:
```bash
cabal repl
```

And functions from modules can be called with, for example `CRUD.Query`:
```haskell
import CRUD.Query
test
-- output: Hello from Query
fetchPersonsQ
-- output: [Person {personId = 1, personName = "Elman", personAge = 30}]
```