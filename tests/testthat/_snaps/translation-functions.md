# Translation works

    Code
      translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "fr",
        "en")
    Output
      # A tibble: 21,483 x 15
          year marital        age race  rincome partyid relig denom tvhours marital_fr
         <int> <chr>        <int> <chr> <chr>   <chr>   <chr> <chr>   <int> <chr>     
       1  2000 Never marri~    26 White $8000 ~ Ind,ne~ Prot~ Sout~      12 Jamais ma~
       2  2000 Divorced        48 White $8000 ~ Not st~ Prot~ Bapt~      NA Divorcé.e 
       3  2000 Widowed         67 White Not ap~ Indepe~ Prot~ No d~       2 Veuf/Veuve
       4  2000 Never marri~    39 White Not ap~ Ind,ne~ Orth~ Not ~       4 Jamais ma~
       5  2000 Divorced        25 White Not ap~ Not st~ None  Not ~       1 Divorcé.e 
       6  2000 Married         25 White $20000~ Strong~ Prot~ Sout~      NA Marié.e   
       7  2000 Never marri~    36 White $25000~ Not st~ Chri~ Not ~       3 Jamais ma~
       8  2000 Divorced        44 White $7000 ~ Ind,ne~ Prot~ Luth~      NA Divorcé.e 
       9  2000 Married         44 White $25000~ Not st~ Prot~ Other       0 Marié.e   
      10  2000 Married         47 White $25000~ Strong~ Prot~ Sout~       3 Marié.e   
      # i 21,473 more rows
      # i 5 more variables: race_fr <chr>, rincome_fr <chr>, partyid_fr <chr>,
      #   relig_fr <chr>, denom_fr <chr>

