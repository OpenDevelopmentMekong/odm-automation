import urllib
import json
import sys

if len(sys.argv) < 1 or len(sys.argv) > 3:
  print 'USAGE python generate_top_tier_taxonomic_terms.py OUTPUT_FILE'

url = 'https://raw.githubusercontent.com/OpenDevelopmentMekong/odm-taxonomy/master/taxonomy_en.json'

def analyzeChildTerm(config,node,topTermName):

  childTermName = str(node['name'])
  config[topTermName].append(childTermName)

  if 'children' in node:
    for childTerm in node['children']:
      analyzeChildTerm(config,childTerm,topTermName);

existing_keys = []
config = {
}

response = urllib.urlopen(url)
data = json.loads(response.read())

for topTerm in data['children']:

  name = str(topTerm['name'])
  config[name] = []
  analyzeChildTerm(config,topTerm,name)

print(config)

with open(sys.argv[1], 'w') as fp:
  json.dump(config, fp)
