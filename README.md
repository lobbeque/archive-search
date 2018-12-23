# Archive-search

A basic fork of [Solr](http://lucene.apache.org/solr/) customized to search for Web Archives corpora. The bash scripts (./scripts/) deploy and install the Solr and Zookeeper sources (./source_solr/ & ./source_zookeeper/) to your machine or server. Collections (./source_collection/) are then ready to receive indexed web archives. Local and cloud installations are both available. 

## Current dependencies 

   1. Solr 5.4.1
   2. Zookeeper 3.4.8
   3. [Archive-search-tools](https://github.com/lobbeque/archive-search-tools)

## Usage 

Download or clone the sources:

```
git clone git@github.com:lobbeque/archive-search.git
```

Then, please set up the configuration file (./scripts/conf/) **.conf_solr** (for local mode) or **.conf_solr_cloud** (for cloud mode) with your own **USER** name and **SEARCH_ROOT** repository.

Important !! **SEARCH_ROOT** has to be created before running any of the following scripts.

Optionally, take a look at the **SOLR_PORT**, **ZOOKEEPER_CLIENT_PORT** & **ZOOKEEPER_SERVERS_LIST**

Copy Solr 5.4.1 and Zookeeper 3.4.8 sources from official repositories into ./source_solr/solr-5.4.1/ & ./source_zookeeper/zookeeper-3.4.8/

Run: 

```
./scripts/install --corpus=mar --mode=cloud 
```

## Options

```
--corpus (optional - default: mar) maroco/palestine1/palestine2/france/...
--type (optional - default: ediasporas) [ediasporas]
--mode (required) [local|cloud]
--nb_shards (optional - default: 2)
--nb_replica (optional - default: 2) 
```

## Licence

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.