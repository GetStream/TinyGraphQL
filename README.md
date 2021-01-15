# TinyGraphQL (WIP)

[![Swift][swift-badge]][swift-url]
[![CI Status][ci-badge]][ci-url]
[![Cocoapods][cocoapods-badge]][cocoapods-url]
![Cocoapods platforms](https://img.shields.io/cocoapods/p/Streamoji)
[![License][license-badge]][license-url]
[![Twitter Follow][follow-badge]][follow-url]
[![Twitter][tweet-badge]][tweet-url]

TinyGraphQL is a simple and lightweight query builder for the Swift language with zero dependencies. It provides a syntax close to that of GraphQL while preventing you from making time-consuming syntax mistakes.

## Table of Contents

- [Snippets](#snippets)
  * [Initialization](#initialization)
  * [Query](#query)
    + [Raw GraphQL](#raw-graphql)
    + [TinyGraphQL](#tinygraphql)
  * [Mutation](#mutation)
    + [Raw GraphQL](#raw-graphql-1)
    + [TinyGraphQL](#tinygraphql-1)
  * [Request](#request)
    + [Raw GraphQL + URLSession](#raw-graphql---urlsession)
    + [TinyGraphQL + URLSession](#tinygraphql---urlsession)
- [Installation](#installation)
  * [SPM](#spm)
  * [CocoaPods](#cocoapods)
  * [Carthage](#carthage)

## Snippets

### Initialization

TinyGraphQL is also a container for pre-configuring your requests. In the initialization step, you should specify the URL for the GraphQL endpoint and any HTTP headers you'd need for the requests.

```swift
let graphQL = TinyGraphQL(
    url: URL(string: "https://api.combase.app/graphql")!,
    headers: ["Content-Type": "application/json", "combase-organization": "5fd7ecb251b33b10c380977b"]
)
```

### Query

See below a comparison between a regular GraphQL query and how to generate a similar query using TinyGraphQL. Note that it's possible to have multiple levels of fields like in regular GraphQL.

#### Raw GraphQL

```graphql
query {
    organizationById(_id: "(id)") {
        name
        stream {
            key
        }
        agentCount
    }
}
```

#### TinyGraphQL

```swift
graphQL.query("organizationById", ["_id": id]) {
    $0.field("name")
    $0.field("stream") {
        $0.field("key")
    }
    $0.field("agentCount")
}
```

### Mutation

Mutations work pretty much the same as queries, except behind the scenes where it becomes a `POST` request instead of `GET`.

#### Raw GraphQL

```graphql
mutation {
    getOrCreateUser(record: { name: "(name)", email: "(email)" }) {
        _id
        name
        streamToken
    }
}
```

#### TinyGraphQL

```swift
graphQL.mutation("getOrCreateUser", ["record": ["name": name, "email": email]]) {
    $0.field("_id")
    $0.field("name")
    $0.field("streamToken")
}
```

### Request

Making a request without TinyGraphQL is quite tedious and error prone. With TinyGraphQL, it's safe and easy. Look below at a comparison between building the request yourself and having TinyGraphQL do it for you.

#### Raw GraphQL + URLSession 

```swift
var urlRequest = URLRequest(url: url)
urlRequest.httpMethod = "POST"
urlRequest.setValue("5fd7ecb251b33b10c380977b", forHTTPHeaderField: "combase-organization")
urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
urlRequest.httpBody = """
{
    "query": "mutation { createTicket(message: \\"\(message)\\", user: \\"\(userId)\\") { _id }}"
}
""".data(using: .utf8)

URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
    // handle response
}
```

#### TinyGraphQL + URLSession

```swift
let urlRequest = graphQL.mutation("createTicket", ["message": message, "user": userId]) {
    $0.field("_id")
}

URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
    // handle response
}
```

## Installation

TinyGraphQL supports all three major dependency managers (SPM, CocoaPods, and Carthage)

### SPM

```swift
.package(name: "TinyGraphQL", url: "https://github.com/getstream/TinyGraphQL", from: "0.0.2")
```

### CocoaPods

```ruby
pod 'TinyGraphQL', '~> 1.0'
```

### Carthage

```
github "getstream/TinyGraphQL" ~> 1.0
```

## Adopters

- [Combase][combase-url]: Combase is an Open Source white-label chat solution that provides everything you need to instantly spin up a powerful, real-time customer support dashboard. TinyGraphQL is used by the [Combase Swift SDK][combase-swift-url].

[swift-badge]: https://img.shields.io/badge/Swift-5.2-orange.svg?style=flat
[swift-url]: https://swift.org

[ci-badge]: https://img.shields.io/github/workflow/status/getstream/tinygraphql/CI
[ci-url]: https://github.com/GetStream/TinyGraphQL/actions?query=workflow%3ACI

[cocoapods-badge]: https://img.shields.io/cocoapods/v/TinyGraphQL
[cocoapods-url]: https://cocoapods.org/pods/TinyGraphQL

[license-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[license-url]: https://tldrlegal.com/license/mit-license

[follow-badge]: https://img.shields.io/twitter/follow/getstream_io?style=social
[follow-url]: https://twitter.com/intent/follow?screen_name=getstream_io

[tweet-badge]: https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGetStream%2FStreamoji
[tweet-url]: https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FGetStream%2FTinyGraphQL

[combase-url]: https://comba.se
[combase-swift-url]: https://github.com/getstream/combase-swift
