#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[  $1 ]]
  then
     if [[ $1 =~ ^[0-9]+$ ]]
        then
          atomic_number=$($PSQL "select atomic_number from elements where atomic_number = '$1' ")
          a_n_Formated=$(echo $atomic_number | sed 's/ //')
          else
          symb=$($PSQL "select symbol from elements where symbol = '$1'")
          s_Formated=$(echo $symb | sed 's/ //')
          
          nam=$($PSQL "select name from elements where name = '$1'")
          n_Formated=$(echo $nam | sed 's/ //')
      fi
  if [[ $atomic_number ]]
      then
      
      symbol=$($PSQL "select symbol from elements where atomic_number = $atomic_number")
      s_Formated=$(echo $symbol | sed 's/ //')
      type=$($PSQL "select type from types inner join properties using(type_id) where atomic_number = $atomic_number")
      t_Formated=$(echo $type | sed 's/ //')
      name=$($PSQL "select name from elements where atomic_number = $atomic_number")
      n_Formated=$(echo $name | sed 's/ //')
      atomic_mass=$($PSQL "select atomic_mass from elements inner join properties using(atomic_number) where atomic_number = $atomic_number")
      a_m_Formated=$(echo $atomic_mass | sed 's/ //')
      melting_point_celsius=$($PSQL "select melting_point_celsius from elements inner join properties using(atomic_number) where atomic_number = $atomic_number")
      m_p_Formated=$(echo $melting_point_celsius | sed 's/ //')
      boiling_point_celsius=$($PSQL "select boiling_point_celsius from elements inner join properties using(atomic_number) where atomic_number = $atomic_number")
      b_p_Formated=$(echo $boiling_point_celsius | sed 's/ //')
      echo "The element with atomic number $a_n_Formated is $n_Formated ($s_Formated). It's a $t_Formated, with a mass of $a_m_Formated amu. $n_Formated has a melting point of $m_p_Formated celsius and a boiling point of $b_p_Formated celsius."
       
       elif [[ $symb ]]
        then
        
        atomic_number=$($PSQL "select atomic_number from elements where symbol = '$s_Formated' ")
        a_n_Formated=$(echo $atomic_number | sed 's/ //')
        type=$($PSQL "select type from types inner join properties using(type_id) where atomic_number = '$a_n_Formated' ")
        t_Formated=$(echo $type | sed 's/ //')
        name=$($PSQL "select name from elements where symbol = '$s_Formated'")
        n_Formated=$(echo $name | sed 's/ //')
        atomic_mass=$($PSQL "select atomic_mass from elements inner join properties using(atomic_number) where symbol = '$s_Formated'")
        a_m_Formated=$(echo $atomic_mass | sed 's/ //')
        melting_point_celsius=$($PSQL "select melting_point_celsius from elements inner join properties using(atomic_number) where symbol = '$s_Formated'")
        m_p_Formated=$(echo $melting_point_celsius | sed 's/ //')
        boiling_point_celsius=$($PSQL "select boiling_point_celsius from elements inner join properties using(atomic_number) where symbol = '$s_Formated'")
        b_p_Formated=$(echo $boiling_point_celsius | sed 's/ //')
        echo "The element with atomic number $a_n_Formated is $n_Formated ($s_Formated). It's a $t_Formated, with a mass of $a_m_Formated amu. $n_Formated has a melting point of $m_p_Formated celsius and a boiling point of $b_p_Formated celsius."
      
      elif [[ $nam ]]
        then
        
        symbol=$($PSQL "select symbol from elements where name = '$n_Formated'")
        s_Formated=$(echo $symbol | sed 's/ //')
        atomic_number=$($PSQL "select atomic_number from elements where name = '$n_Formated' ")
        a_n_Formated=$(echo $atomic_number | sed 's/ //')
        type=$($PSQL "select type from types inner join properties using(type_id) where atomic_number = '$a_n_Formated' ")
        t_Formated=$(echo $type | sed 's/ //')
        atomic_mass=$($PSQL "select atomic_mass from elements inner join properties using(atomic_number) where name = '$n_Formated'")
        a_m_Formated=$(echo $atomic_mass | sed 's/ //')
        melting_point_celsius=$($PSQL "select melting_point_celsius from elements inner join properties using(atomic_number) where name = '$n_Formated'")
        m_p_Formated=$(echo $melting_point_celsius | sed 's/ //')
        boiling_point_celsius=$($PSQL "select boiling_point_celsius from elements inner join properties using(atomic_number) where name = '$n_Formated'")
        b_p_Formated=$(echo $boiling_point_celsius | sed 's/ //')
  
        echo "The element with atomic number $a_n_Formated is $n_Formated ($s_Formated). It's a $t_Formated, with a mass of $a_m_Formated amu. $n_Formated has a melting point of $m_p_Formated celsius and a boiling point of $b_p_Formated celsius."
        
       else
        echo "I could not find that element in the database."
      fi
  else
  echo Please provide an element as an argument.
fi