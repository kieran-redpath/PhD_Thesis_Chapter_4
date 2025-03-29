# PhD_Thesis_Chapter_4

A versioned, tracked project that has the correct code, R version, and package versions to reproducibly create the results from Chapter 4 of this PhD Thesis.

# renv:

renv is used to create a reproducible r environment - i.e. all package versions are consistent within this repository.

renv requires renv.lock, renv/activate.R, and settings in .Rprofile to work correctly.

Upon cloning this repository, open the project file in R 4.2.2 and renv should automatically bootstrap and install itself.

Then, use renv::restore() to restore the project library locally. If asked, input y to activate the project before restore.
