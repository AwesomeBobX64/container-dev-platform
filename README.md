# Container-based Development Platform
This repos is an example of how to provide your team with a development platform based on containers and is a follow-up
to [this article](https://awesomebobx64.medium.com/container-based-development-platform-7610945847c2).

## Guiding Principles
The design principles that guide our implementation are opinionated conventions for solving specific problems
effectively. An effective developer platform promotes developer productivity and consistency while remaining
maintainable and extensible. Therefore, our guiding principles ensure our platform continues to deliver this value as
we maintain and extend it.

### Convention over Configuration
An opinionated stance on conventions, such as directory structure, common patterns, and parameter or argument naming,
allows a development team to focus their critical thinking and decision-making on more important problems. For example,
in our repo, having a consistent directory structure of `images/{runtime}/Dockerfile` provides an intuitive maintenance
experience while also making obvious where important changes belong. Additional runtimes can also adopt established
building and validation conventions without further configuration. Developers can simply copy an existing directory and
customize the files to meet the requirements of the new runtime.

### The Open/Closed and Single Responsibility Principles
Originating from the five object-oriented programming SOLID programming principles, The Open/Closed and Single
Responsibility principles in our implementation reduce complexity, promote maintainability, encourage reusability, and
ensure extensibility.

The Single Responsibility principle is a key aspect of our developer platform. By breaking down our platform into
smaller, specialized (i.e., single responsibility) components, we minimize complexity and promote maintainability. As
each component is designed to serve a single responsibility, it typically has only one reason to change its
implementation.

Single responsibility dovetails nicely with the Open/Closed principle, allowing us to extend a single responsibility
component with another, adding new behavior or specialization without modifying existing components. For example, in our
container-based developer platform, the multi-stage node image has a "ci" stage that extends the "base" stage to add new
behavior, capabilities, and tools without changing the "base" stage. This approach ensures that the "base" stage remains
stable, containing only what is necessary for its responsibility while enabling the platform to evolve and adapt to new
requirements.
...

```
# top-level "component"
FROM alpine:${ALPINE_VERSION} AS base

COPY scripts/install-base.sh /usr/local/bin

RUN /usr/local/bin/install-base.sh

# Extends top-level "component" adding new value without modifying it
FROM base AS ci

COPY scripts/install-ci.sh /usr/local/bin

RUN /usr/local/bin/install-ci.sh
```

### Idempotency
Idempotency is crucial for a developer platform as it can save time, prevent errors, and give developers peace of mind.
Even when we need to be more mindful and thorough, such as reading error messages or double-checking our configurations
before retrying a failed operation, idempotency ensures that the desired outcome is consistently produced, building
developer confidence and eliminating issues that can compromise the platform's stability.

Installing our container-based developer platform on a new or existing machine is an important use case where
idempotency can save hours of developer time. By ensuring that the install command works reliably every time after the
first, our platform adds core value by allowing developers to focus on leveraging the platform, not toiling with getting
it to work. This may require additional time, effort, and complexity, but the added value and peace of mind are worth it.

Of course, we strive to eliminate as much accidental complexity as possible. Accidental complexity is additional
complexity not required to solve our core problems. However, in this case, adding necessary complexity to the commands
that install our container-based development platform can be performed idempotently and is part of the core value our
platform adds.

By reducing the toil of getting the platform to work, we empower developers to add value to their projects more quickly
and easily. Running our install command should reliably work the first time and every time after that, just like the
other behaviors and components our platform provides.