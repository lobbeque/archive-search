# Archive-search

A simple fork of [Solr](http://lucene.apache.org/solr/) customized to search inside Web Archives corpora. Primarily designed for the exploration of the archived data of the [e-Diasporas Atlas](http://www.e-diasporas.fr/). 

The scripts contained in `./scripts/` deploy and install the Solr and Zookeeper sources from `./source_solr/` and `./source_zookeeper/` to a given directory. The Solr collections initialized in `./source_collection/` are then ready to receive indexed web archives from any external providers. Local and cloud installations are both available. 

## Current dependencies 

   1. Solr 5.4.1
   2. Zookeeper 3.4.8
   3. [Archive-search-tools](https://github.com/lobbeque/archive-search-tools)

## Usage 

Download or clone the source file:

```
git clone git@github.com:lobbeque/archive-search.git
```
Copy [Solr](http://archive.apache.org/dist/lucene/solr/5.3.1/) and [Zookeeper](http://archive.apache.org/dist/zookeeper/zookeeper-3.4.8/) sources from the official depo into the cloned repository of archive-search:

```
cd ~/
tar -zxvf solr-5.3.1.tar.gz
cp -r solr-5.3.1 ~/archive-search/source_solr/
tar -zxvf zookeeper-3.4.8.tar.gz
cp -r zookeeper-3.4.8 ~/archive-search/source_zookeeper/
```
Create dedicated directories for the installation and for the future Solr collections, such as:

```
mkdir -p ~/search
mkdir -p ~/data/solr
mkdir -p ~/data/solr_bck
```

Initialize the main configuration file `./scripts/conf/.conf_solr` (local mode) or `./scripts/conf/.conf_solr_cloud` (cloud mode), such as:

```
USER=yourname
START_MODE=cloud
SEARCH_ROOT=~/search
ZOOKEEPER_VERSION=3.4.8
ZOOKEEPER_CLIENT_PORT=2181
ZOOKEEPER_CURRENT_SERVER=1
ZOOKEEPER_SERVERS_LIST="127.0.0.1:2888:3888"
ZOOKEEPER_ROOT=${SEARCH_ROOT}/zookeeper-${ZOOKEEPER_VERSION}
ZOOKEEPER_DATA=${ZOOKEEPER_ROOT}/data
SOLR_VERSION=5.4.1
SOLR_PORT=8800
SOLR_ROOT=${SEARCH_ROOT}/solr-${SOLR_VERSION}
SOLR_RUN=${SOLR_ROOT}/run
SOLR_SERVER=${SOLR_ROOT}/server
SOLR_LOGS=${SOLR_SERVER}/logs
SOLR_CORES=${SOLR_SERVER}/solr
REMOTE_SOLR_CORES=~/data/solr
REMOTE_SOLR_CORES_BCK=~/data/solr_bck
```
**Important :** pay attention to `ZOOKEEPER_CLIENT_PORT`, `ZOOKEEPER_SERVERS_LIST`, `SOLR_PORT` and change Solr or Zookeeper versions if needed.   

Run the installation script: 

```
./scripts/install --mode=cloud 
```

By default, collections are divided by [corpus](http://maps.e-diasporas.fr/) and the installation create an empty moroccan folder. See `./source_collection/conf/` to change the configuration of your Solr collections (name, schema, solrconfig, etc.). The installation can be set up as follow:

```
--corpus (optional - default: mar) maroco/palestine1/palestine2/france/...
--type (optional - default: ediasporas) [ediasporas]
--mode (required) [local|cloud]
--nb_shards (optional - default: 2)
--nb_replica (optional - default: 2) 
```

Then you can start, restart or stop Solr:

```
cd ~/search/solr-5.4.1/
./start
./restart
./stop
```

See the specific documentations of [Solr](http://lucene.apache.org/solr/resources.html) and [Zookeeper](https://zookeeper.apache.org/documentation.html) for more configurations.

## Licence

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.