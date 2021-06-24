let bissextile annee =
  not ((annee mod 4 <> 0) 
       || (annee mod 100 = 0 & annee mod 400 <> 0))
