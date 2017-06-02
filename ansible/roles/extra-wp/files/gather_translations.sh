#!/usr/bin/env bash

USER="api"

declare -a projects=("odm-wp-odm_theme" "odm-wp-laws-pages" "odm-wp-odm_dash" "odm-wp-odm_user_feedback" "odm-wpckan" "wp-odm_solr" "wpsparql")
declare -A resources=(["odm-wp-odm_theme"]="enpo" ["odm-wp-laws-pages"]="wp-odm_tabular_pages-enpo" ["odm-wp-odm_dash"]="enpo" ["odm-wp-odm_user_feedback"]="wp-odm_user_feedback-enpo" ["odm-wpckan"]="wpckan-enpo" ["wp-odm_solr"]="wp-odm_solr-enpo" ["wpsparql"]="enpo")

if [ -z "$1" ]; then
  echo "Please specify a transifex API Key"
  exit 0
fi

## now loop through the above array
for i in "${projects[@]}"
do
  echo "Pulling strings from: $i"
  RESOURCE=${resources["$i"]};
  for lang in {'km','vi','my','th','la'}
  do      
    URL=https://www.transifex.com/api/2/project/$i/resource/$RESOURCE/translation/$lang/?file=po
    echo $URL
    curl --user $USER:$1 -X GET $URL -o $i-$resource-$lang.po
  done
done

for lang in {'km','vi','my','th','la'}
do      
  msgcat --use-first *$lang.po -o $lang.po
done

