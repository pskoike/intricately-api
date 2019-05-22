# README

This is a small API built with Rails `5.2`, Ruby `2.5.3` and a relational Database
`postgresql`

* How to run the API on localhost
  - Clone the repository
  - run `bundle install`
  - run `bundle exec rails db:create`
  - run `bundle exec rspec` to run test suite


## End-points

 #### GET "/dns_records"
  Example request

  `http://localhost:3000/api/v1/dns_records?include_hostnames[]=qwe.com&include_hostnames[]=asd.com&exclude_hostnames[]=zxc.com&page=1`


  ##### Params
    - include_hostnames[]: hostname to be included on the result.
    - exclude_hostnames[]: hostname to be excluded from the result.
    - page: Number page

  ##### Response example - status 200
  ```json
  {
    "total_dns_records": 2,
    "matching_records": [
        {
            "id": 13,
            "ip": "10.0.0.1"
        },
        {
            "id": 15,
            "ip": "10.0.0.3"
        }
    ],
    "hostnames": [
        {
            "domain": "qwe.com",
            "matching_dns_records": 1
        },
        {
            "domain": "asd.com",
            "matching_dns_records": 1
        }
    ]
}
```

#### POST  "/dns_records"
Example request

`http://localhost:3000/api/v1/dns_records`

##### body

```
{
    "dns_record": {
        "ip": "10.0.0.98",
        "hostnames": [
            "qaz.com",
            "poi.com"
        ]
    }
}
```

##### Response example - status 201

```json
{
    "dns_record_id": 17
}
```
