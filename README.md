# Ruby on Rails Patterns: Service Objects and Interactors

![logo](https://res.cloudinary.com/practicaldev/image/fetch/s--jvDLhx0b--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/cpcr5w0kgl6j94tss7n9.png)

## About The Project
This is a Ruby on Rails demo application that shows how to organise a fat controller intro service objects.
And then goes further into adding `interactor` gem and showing how to better organise this concept
of service objects with interactors.

## How To Run
This is a Ruby on Rails API only application. Since we only need API to demonstrate the patterns. Let's create the app with

```bash
rails new rails-service \
  --skip-action-text \
  --skip-active-storage \
  --skip-javascript \
  --skip-spring -T \
  --skip-turbolinks \
  --skip-sprockets \
  --skip-test \
  --api
```

We will skip some of the parts that we know are not necessary for this demonstration. The migration and seed are already in. So let's run

```bash
rails db:migrate db:seed
```

The controllers are versioned into `v1`, `v2`, `v3`. Each controller shows how to tackle the problem with user registration.
This controller handles user creation, subscription creation for user, adding a dedicated support person for the user, sending welcome email and update time series based metrics table for revenue calculation.
You can hit the api with

```bash
curl -XPOST -H "Content-type: application/json" -d '{
    "name": "Blake Dawson",
    "email": "blake@dawson.com",
    "pass": "OnePass",
    "product_name": "Business"
}' 'localhost:3000/api/v1/user/create'
```

Replace `v1` with `v2` or `v3` to hit different versions of same controller

## Contribution
Want to contribute? Great!

To fix a bug or enhance an existing code, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request

## License
MIT © [MD Ahad Hasan](https://github.com/joker666)