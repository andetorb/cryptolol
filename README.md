# cryptolol
Fetches cryptoprices from [cli.fyi](https://www.cli.fyi) and/or [Coinmarketcap](https://www.coinmarketcap.com). [cURL](https://github.com/curl/curl) is used for fetching the data, and jq used for parsing the JSON-formatted data. Use your package manager or see the [Github repo](https://github.com/stedolan/jq) for build instructions for jq.

## Usage

Add it to an alias or put it in ~/home/bin/


```bash
$ coins.sh
Usage: coins.sh -cpb
```


### Todo
* Read currencies from file
* Output to CSV
* Choose output parameters
* Fetch data from different sites
* Fetch other currencies?

### Licence
BSD simplified, see [LICENSE.md](LICENSE.md).
