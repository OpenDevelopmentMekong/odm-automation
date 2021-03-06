import urllib
import json
import sys

if len(sys.argv) < 1 or len(sys.argv) > 3:
    print 'USAGE python generate_stats.py OUTPUT_FILE COUNTRY_CODE'

url = 'https://raw.githubusercontent.com/OpenDevelopmentMekong/odm-taxonomy/master/taxonomy_en.json'

def getNumberOfRecordsByTaxonomy(name):
    
    url = 'https://data.opendevelopmentmekong.net/api/3/action/package_search?fq=extras_taxonomy:"' + name + '"';
    if sys.argv[2] != 'all':
        url =  url + '+extras_odm_spatial_range:' + sys.argv[2];
    
    response = urllib.urlopen(url)
    data = json.loads(response.read())

    return data['result']['count']

def analyzeItem(config,node,parent_name):
    
    for item in node:
        
        name = str(item['name'])
        
        if name not in existing_keys:
      
            print('analyzing item', name); 
      
            config["config"].append([name,parent_name,getNumberOfRecordsByTaxonomy(name)]);
            existing_keys.append(name);
      
            if 'children' in item:
                analyzeItem(config,item['children'],name);

existing_keys = []
config = {
"config":[["All",None,0]]
}

response = urllib.urlopen(url)
data = json.loads(response.read())

analyzeItem(config,data['children'],'All')

print(config)

with open(sys.argv[1], 'w') as fp:
    json.dump(config, fp)


    