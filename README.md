# Newsroom Challenge August 2020 
This fullstack challenge ran over 3 weeks. We were 2 groups with 4 peoples each working on the same challenge, after 1.5 week some of us had  to change teams to practice working in different team compositions and be able to explain code to new team members. 

## 3 applications with 1 server
This Ruby on Rails server hosts 3 frontend applications.
- [El-gaucho nyheter](https://el-gaucho-nyheter.netlify.app/), [github](https://github.com/Saralundkvist86/client_user_el_gaucho_nyheter)  where visitors can read news. To be able to read premium articles you have to sign up as a user. 
Geolocation API is used to be able to display local news depending on the surfers position (Sweden/US)
- [El-gaucho admin](https://el-gaucho-admin.netlify.app/), [github](https://github.com/Saralundkvist86/client_admin_el_gaucho_nyheter) where journalists can publish articles. Images are able to be attached using toBase64.
- [mobile](https://github.com/Saralundkvist86/mobile_el_gaucho_nyheter) is a React Native mobile application 

#### Setup
To use this server, fork this repository to your own GitHub account and clone it to your local workspace.

Install all of the dependencies:

``` $ bundle ```

Create and migrate local database :

``` $ Rails db:create db:migrate ```

Run all test suites

``` $ rspec ```
