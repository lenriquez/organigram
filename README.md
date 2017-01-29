# Organizatianl Diagram

## General Purpose
Companies reorganize their people constantly having a tool that helps find a person with a specify knowledge or skill
is very usefu

## Personal Purpose
- Practice Rails, Ruby and Angular
- Check different methods of authentication
- Learn D3

## About this project
- Use version 2.3.0 of Ruby
- Rails 5

## Configuration

### ElasticSearch
```bash
brew install elasticsearch
brew services start elasticsearch
```
###Test
```bash
curl 'http://localhost:9200/?pretty'
```

``` bash
git clone git@github.com:lenriquez/organigram.git
cd organigram
bundle install
```

### Database initialization
``` bash
rails db:migrate
rake db:seed
```

### Test
```bash
rspec
```

or

```bash
rspec path/to/spec/file.rb
```

