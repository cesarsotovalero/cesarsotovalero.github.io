---
layout: post
title: Clean Commit Messages
subtitle: The way I like to write them
tags: github
description: |
  Writing clean commit messages is a craft that benefits the project in the long run. It enhances collaboration, eases maintenance, and keeps the project history informative and navigable. At the individual level, a commit message is a reflection of professionalism and attention to detail. This article highlights some of the practices I follow with the aim of writing clean commit messages.
keywords:
  - Git
  - GitHub
  - Commit messages
  - Gitmoji
image: ../img/posts/2021/2021-01-12/station_signs_cover.jpg
share-img: ../img/posts/2021/2021-01-12/station_signs_cover.jpg
show-avatar: false
toc: true
date: 2021/01/12
author: cesarsotovalero
published: true
---

It doesn't matter what kind of software you're building; you will inevitably use Git these days.
I think Git is one of those skills for which it takes a little amount of time to learn the basics, but a lifetime to master.
But this article is not about the Git magics and nuances.
This time, I'll focus on something simpler: Git commit messages.
An ugly commit message is a bad smell for a repository. 
It hurts newcomers' eyes and is an evident sign of a lack of discipline in the project.
Well-crafted commit messages are therefore important, providing context, rationale, and insight into the changes we've made across the project's history.
In this article, I'll delve into the practice of writing clean commit messages.
This is my experience after writing a ton of good and bad commit messages myself.
My intention is to promote the practice of writing commit messages that not only serve as documentation footprints but also aid in effective team communication and project management.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/2021-01-12/station_signs.jpg alt: "A picture of sings in a train station" %}
  <figcaption class="stroke"> 
    &#169; Our surrounding is full of short signs and insightful messages. Photo at <a href="https://maps.app.goo.gl/XhtTqD56H9sHzQzR6">Stockholms Centralstation</a>.
  </figcaption>
</figure>

So you know what a commit message is, [right](https://training.github.com/downloads/github-git-cheat-sheet/)?
Just in case, here's an example of the Bash command to make a commit with a message:

```bash
git commit -S -m "Fix typo in README.md"
```

The `-m` flag is used to add a message to the commit.
The `-S` flag is used to sign the commit with GPG, but that's a topic for another post.
This article is only about what to put in the message (i.e., the string `"Fix typo in README.md"` in the previous example).

There are good and bad commit messages.
For example, here's a **good** commit made by me: <a href="https://github.com/ASSERT-KTH/depclean/commit/12e76e6bf689062f8bbdef00370fb96c8cdc0803"><i class="fab fa-github"></i></a> [12e76e6b](https://github.com/ASSERT-KTH/depclean/commit/12e76e6bf689062f8bbdef00370fb96c8cdc0803), and this a **bad** one: <a href="https://github.com/ASSERT-KTH/depclean/commit/5c13f9df5bb9638e04c0f2bdba3190544ffb2784"><i class="fab fa-github"></i></a> [5c13f9df](https://github.com/ASSERT-KTH/depclean/commit/5c13f9df5bb9638e04c0f2bdba3190544ffb2784).
We'll look at what makes the first one good and the second one bad in the rest of this article.

# Anatomy of a Commit Message

I distinguish between two types of commit messages: short and elaborated.

**Short**. Short commit messages consist of a single line of text that summarizes the change. 
They are suitable for simple changes, such as fixing a typo or renaming a variable.

**Elaborated**. Elaborated commit messages traditionally include three parts: a header (i.e., the short part, as mentioned earlier), a body, and a footer. 
I recommend avoiding lengthy text in the body unless it's strictly necessary. 
Instead, I strongly suggest providing a link to the GitHub issue or pull request that contains the detailed information about the complex change.[^1]

## Guidelines for Short Commit Messages

A short commit message describes something DONE, not something to do:

- **Keep it concise**: Aim for 50 characters or fewer. This is a good practice because it forces you to be concise and to the point. If you need more space, you can always add a body to the commit message.
- **Use the imperative mood**: Write as if commanding the codebase to change. Phrases like "Fix bug" or "Add feature" keep messages clear and direct.
- **Capitalize the first letter**: Start with a capital letter and don't use camel case or all caps.
- **No period at the end**: The header is a title, not a sentence. It reflects an action, not a statement.
    
## Guidelines for Elaborated Commit Messages

Elaborated commit messages can be used when there is a need to explain what and why we have done something.
They are useful for elaborating on the reasoning, any challenges faced, or potential implications of the changes.
These commit messages typically contain a header, body, and footer, concatenated with a blank line between each part.
The body is used to provide a more detailed explanation of the change.
The footer is used to add references to related issues or pull requests when there is more than one.

Here's an example:

{% highlight bash linenos %}
git commit -m "Refactor subsystem X for readability" \
-m "This commit makes several changes to the subsystem X to improve the readability and maintenance of the code. 
- Split the `processData` function into smaller, more manageable functions.
- Renamed variables and functions to be more descriptive.
- Introduced early returns to reduce nesting and improve flow.
Additionally, the renaming efforts were guided by our coding standards, ensuring that names accurately reflect the purpose and functionality of their corresponding elements." \
-m "Resolves: #123, #456
Related: #789
BREAKING CHANGE: This commit changes the function signature of `processData`. It now expects a `DataInput` type as its first argument instead of a plain object. This change is necessary to enforce type safety and will require updates to all calling code.
Reviewed-by: John Doe"
{% endhighlight %}

A few suggestions:

- **Explain why the commit was made**: The body should explain why the commit was necessary. Provide context that couldn't fit in the header.
- **Make it readable**: Use complete sentences and proper punctuation. Bullet points can help list changes or important points.
- **Include references**: If the commit is related to issue tracker IDs or relevant URLs, list them here to create connections.
- **Link issues**: Use the footer to reference related issues or pull requests. Phrases like "Closes #123" automatically link commits to issues in platforms like GitHub.
- **Breaking changes**: If your change is breaking, highlight it here. Begin with a label like "BREAKING CHANGE:" and describe the impact and migration path.
- **Add separation**: Add a blank line separating the summary from the body (unless you omit the body entirely).

# Conventional Commit Messages

The [conventional commit](https://www.conventionalcommits.org/) message style is another way you can level up your commit messages. 
It consists of starting your commit message with a specific word from a set of words in order to add semantic meaning to the commit. 

Here are some examples of conventional commit prefixes:

| Prefix  | Description                                |
|---------|--------------------------------------------|
| `Feat`  | feature                                    |
| `Fix`   | bug fixes                                  |
| `Docs`  | changes to the documentation like `README` |
| `Style` | style or formatting change                 |
| `Perf`  | improves code performance                  |
| `Test`  | test of a feature                          |

Using the conventional commit method makes it easy for project contributors to filter and search for specific commits.

# Autolink References

If the commit refers to an issue, add this information to the commit message header or body. 
For example, the GitHub web platform uses [autolink references](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls) to automatically convert issue ids (e.g. `#123`) to links referring to the related issue URL.

Examples in header:

```bash
git commit -m "Refer to GitHub issue #123"
```

or

```bash
git commit -m "JIRA-123: Refer to Jira ticket with project identifier CAT..."
```

Here's how to set up autolink references on GitHub:

1. Go to your repository's **Settings**.
2. Find the section named **Autolink references**.
3. Click **Add autolink reference**.
4. Enter the **Key Prefix** (e.g., `JIRA-`) and the **URL Template**, which is the URL pattern pointing to the external system with a placeholder for the issue number (e.g., `https://yourcompany.jira.com/browse/123` where is the issue number).

After this configuration, any mention of `JIRA-123` in the repository (within the scope of issues, pull requests, and commit messages) will automatically turn into a link that points to `https://yourcompany.jira.com/browse/123`.
This link will lead directly to the corresponding issue `123` in the JIRA tracking system (assuming you've set up the URL pattern correctly to point to your JIRA instance).

# Gitmoji

[Gitmoji](https://gitmoji.dev/) is an emoji guide for your commit messages.
It's a way to add some [color and fun](https://engineeringfordatascience.com/posts/gitmoji/) to your commit messages, making them more expressive and easier to understand.
The idea is to use emojis to represent the type of change that was made in the commit.

Here is an example of how it looks like using Gitmoji:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/2021-01-12/fastapi-with-gitmoji.png alt: "Example of a repo using Gitmoji" %}
  <figcaption class="stroke"> 
    &#169; Example of a repo using Gitmoji. Featuring the <a href="https://github.com/tiangolo/fastapi">FastAPI framework</a> Git history.
  </figcaption>
</figure>

# Good Practices

Here are some practices I recommend to keep your commit messages clean and informative.

## Atomic Commits

An atomic commit means that a single commit represents only one specific change. 
This doesn't necessarily mean only one file or even one line has changed, but rather one "logical" change. 
Atomic commits make it easier to understand changes, debug issues, and identify potential problems. 
They also make it easier to comprehend individual changes and revert them if necessary.

> Before committing, review changes with `git diff`. If changes cover multiple areas or features, consider staging chunks or individual files with `git add -p` or `git add <filename>`.

## Commit Regularly 

Committing regularly is important.
It ensures that changes are incremental and manageable, allowing for easier reviews, debugging, and rollbacks if necessary.
Also, small commits are easier to write, providing a clear and concise record of changes made to the codebase.

> Commit early and often. If you’re working on a feature or bug fix, commit your changes as soon as they’re ready. This helps to keep your changes organized and makes it easier to collaborate with others.

## Use Commit Hooks

Git provides [hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks), which are scripts that can run automatically before or after key events such as commits or pushes. 
We can set up a pre-commit hook to ensure commit messages adhere to a specific format or standard. 
For example, a hook can be used to check that commit messages follow conventional commit standards or include references to issues or pull requests.

> Explore tools like [commitlint](https://commitlint.js.org/) or [pre-commit](https://pre-commit.com/) to automate checks and standards for your commit messages.

## Include Tests in Commits

Whenever we're adding a new feature or fixing a bug, including tests that verify our changes work as intended is good practice. 
This approach ensures that future modifications won't unintentionally compromise the integrity of our code.

> Commit tests in the same commit as the code changes. This way, if you or anyone else needs to roll back, the tests get rolled back too.

## Avoid Committing Generated Files

Files that are generated by build tools, compilers, or other automated processes should not typically be committed because they can be regenerated from source files. 
For instance, minified JavaScript files or compiled binaries.

> Use a [`.gitignore`](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files) file to specify and exclude automatically generated files.

## Avoid Generic Messages

Messages like "fix bug" or "update" are not helpful. 
It's key to be specific about what was fixed or updated.

> If you’re not sure what to write, consider the following questions: What did I change? Why did I change it? How does it affect the codebase?

# Conclusion

I believe that writing clean commit messages is a craft that benefits me and my team in the long run.
It enhances our collaboration, eases maintenance, and keeps our project history informative and navigable. 
By adhering to the guidelines I've outlined above, you can contribute not just code, but also clarity and understanding to your projects.
I see each commit message as a reflection of professionalism and attention to detail. 
Let's commit to excellence, one clean message at a time!

# External Resources

- [Guidelines for writing good commit messages](https://github.com/joelparkerhenderson/git-commit-message)
- [Commit Message Guidelines](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53)
- [Git Commit Good Practices](https://wiki.openstack.org/wiki/GitCommitMessages#Information_in_commit_messages)
- [Which commit message convention do you use at work?](https://hashnode.com/post/which-commit-message-convention-do-you-use-at-work-ck3e4jbdd00zyo4s1h7mc7e0g) 

# Footnotes

[^1]: The GitHub platform has great features and integrations with issues and pull requests. Overall they're the best places to discuss complex changes in the codebase.













