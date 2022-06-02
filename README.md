# Tea Subscription
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

#### Overview
This app creates an API for a tea subscription service. 

#### Database
![tea_subscription_db](https://user-images.githubusercontent.com/84606723/171562606-a4569eb4-55b5-4686-b7ca-079100fbf80c.png)

#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>

## Endpoints

#### Request
`POST /api/v1/customers/:customer_id/subscriptions`
##### Request Body
```
    {
      "customer_id": 1,
      "tea_id": 1,
      "title": "tea.title",
      "price": 6.9,
      "status": "active",
      "frequency": "annually"
    }
```
#### Response
```
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "tea.title",
            "price": 6.9,
            "status": "active",
            "frequency": "annually"
        }
    }
}
```

#### Request
`PATCH /api/v1/customers/:customer_id/subscriptions/:subscription_id`
##### Request Body
```
   { 
   "status": "canceled" 
   }
```
#### Response
```
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "tea.title",
            "price": 6.9,
            "status": "canceled",
            "frequency": "annually"
        }
    }
}
```
#### Request
`GET /api/v1/customers/:customer_id/subscriptions`
#### Response
```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "My Dongding Subscription",
                "price": 5.75,
                "status": "active",
                "frequency": "monthly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 2,
                "title": "My Shincha Subscription",
                "price": 6.9,
                "status": "canceled",
                "frequency": "annually"
            }
        }
    ]
}
```
#### Request
`POST /api/v1/teas`
##### Request Body
```
   {
      "title": "Really good tea",
      "description": "Actually it is really good",
      "temperature": 200,
      "brew_time": 4
    }
```
#### Response
```
{
    "data": {
        "id": "4",
        "type": "tea",
        "attributes": {
            "title": "Really good tea",
            "description": "Actually it is really good",
            "temperature": 200,
            "brew_time": 4
        }
    }
}

#### Request
`POST /api/v1/customers`
##### Request Body
```
   {
      "first_name": "Britney",
      "last_name": "Spears",
      "email": "email@someemail.com",
      "address": "Somewhere in Los Angeles"
    }
```
#### Response
```
{
   "data": {
        "id": "4",
        "type": "customer",
        "attributes": {
            "first_name": "Britney",
            "last_name": "Spears",
            "email": "email@someemail.com",
            "address": "Somewhere in Los Angeles"
        }
    }
}
```
