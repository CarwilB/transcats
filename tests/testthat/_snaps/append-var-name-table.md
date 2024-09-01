# Appending works as expected

    Code
      append_to_var_name_table(uc_var_table, n_trans_table)
    Output
      # A tibble: 3 x 70
        language   event_title    unconfirmed year  month day   later_year later_month
        <chr>      <chr>          <chr>       <chr> <chr> <chr> <chr>      <chr>      
      1 en         Event identif~ Unconfirme~ Year  Month Day   Year of D~ Month of D~
      2 es         Identificador~ No confirm~ Año   Mes   Día   Año de Mu~ Mes de Mue~
      3 r_variable event_title    unconfirmed year  month day   later_year later_month
      # i 62 more variables: later_day <chr>, dec_firstname <chr>,
      #   dec_surnames <chr>, id_indiv <chr>, dec_age <chr>, dec_alt_age <chr>,
      #   dec_gender <chr>, dec_ethnicity <chr>, dec_residence <chr>,
      #   dec_nationality <chr>, dec_affiliation <chr>, dec_spec_affiliation <chr>,
      #   dec_title <chr>, cause_death <chr>, cause_medical <chr>, munition <chr>,
      #   weapon <chr>, victim_armed <chr>, perp_category <chr>, perp_group <chr>,
      #   perp_firstname <chr>, perp_surname <chr>, perp_pol_stalemate <chr>, ...

# Works with variables where extension has extra languages

    Code
      append_to_var_name_table(uc_var_table, gss_var_table)[c(1, 6, 71)]
    Output
      # A tibble: 3 x 3
        language   day   tvhours                        
        <chr>      <chr> <chr>                          
      1 en         Day   hours per day watching tv      
      2 es         Día   horas diarias viendo televisión
      3 r_variable day   tvhours                        

