# TinyGraphQL (WIP)

[![Swift][swift-badge]][swift-url]
[![CI Status][ci-badge]][ci-url]
[![Cocoapods][cocoapods-badge]][cocoapods-url]
![Cocoapods platforms](https://img.shields.io/cocoapods/p/Streamoji)
[![License][license-badge]][license-url]
[![Twitter Follow][follow-badge]][follow-url]
[![Twitter][tweet-badge]][tweet-url]

TinyGraphQL is a simple and lightweight query builder for the Swift language with zero dependencies. It provides a syntax close to that of GraphQL while preventing you from making time-consuming syntax mistakes.

## Snippets

### Initialization

```swift
let graphQL = TinyGraphQL(
    url: URL(string: "https://api.combase.app/graphql")!,
    headers: ["Content-Type": "application/json", "combase-organization": "5fd7ecb251b33b10c380977b"]
)
```

### Query

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

### Mutation

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
