---
layout: post
title: Commit Messages the Way I Like Them
subtitle: Having fun with Git
tags: github
description: |
  TODO
keywords:
  - Git
  - GitHub
  - Commit messages
image: ../img/posts/2021/2021-01-12/station_signs_cover.jpg
share-img: ../img/posts/2021/2021-01-12/station_signs_cover.jpg
show-avatar: false
toc: true
date: 2021/01/12
author: cesarsotovalero
published: false
---


[//]: # (My writing process:)
[//]: # (I start with 3 questions at the top:)
[//]: # (- What problem am I solving?)
[//]: # (- What are the benefits of solving it?)
[//]: # (- What emotion am I generating?)
[//]: # (From these questions, I create:)
[//]: # (- At least 5 headlines)
[//]: # (- The bullet point summary)
[//]: # (Then I fill in the details.)


I'm not an advanced Git user, I search on StackOverflow when needed.
However, there is something I do all the time: I write commit messages.

As developers, we often view our code as the masterpiece, yet overlook the frame that presents it: the commit message. A well-crafted commit message is like a polished lens through which we can view the history of our project. It provides context, rationale, and insight into the changes we've made. In this post, we'll delve into the art of writing clean commit messages that not only serve as a historical document but also aid in effective team communication and project management.

[//]: # (TODO - Add an examples of a bad commit message and a good one.)

Here's an example of a good commit made by me: <a href="https://github.com/ASSERT-KTH/depclean/commit/12e76e6bf689062f8bbdef00370fb96c8cdc0803"><i class="fab fa-github"></i></a> [here](https://github.com/ASSERT-KTH/depclean/commit/12e76e6bf689062f8bbdef00370fb96c8cdc0803)


Here's an example of a bad commit made by me: <a href="https://github.com/ASSERT-KTH/depclean/commit/5c13f9df5bb9638e04c0f2bdba3190544ffb2784"><i class="fab fa-github"></i></a> [here](https://github.com/ASSERT-KTH/depclean/commit/5c13f9df5bb9638e04c0f2bdba3190544ffb2784)



<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/2021-01-12/station_signs.jpg alt:"A picture of sings in a train station" %}
  <figcaption class="stroke"> 
    &#169; Commits are signals for developers, images and text come better together. Photo at <a href="https://maps.app.goo.gl/XhtTqD56H9sHzQzR6">Stockholms Centralstation</a>.
  </figcaption>
</figure>

Committing regularly is important. It ensures that changes are incremental and manageable, allowing for easier reviews, debugging, and rollbacks if necessary.
Do:
Commit when you’ve completed a single logical change, even if it’s small.
Don’t:
Wait to accumulate many unrelated changes into one big commit.

# Conventional Commits

The conventional commit message style is another way you can level up your commit messages. The conventional commits structure involves starting your commit message with a specified commit type. Commit types include:

Feat– feature

Fix– bug fixes

Docs– changes to the documentation like README

Style– style or formatting change

Perf – improves code performance

Test– test a feature

Using the conventional commit method makes it easy for project contributors to filter and search for specific commits, as shown in the example below:

Summary:

Docs: Fixes typo on in-from-the-depths.md

Description:

Closes ticket #54321

# The Anatomy of a Clean Commit Message

A well-structured commit message consists of three fundamental parts: the subject line, the body, and the footer. Here's how to master each:

## 1. The Subject Line

git commit -m "Your meaningful commit message here"

A commit message is something DONE, not something to do.
Do not end the subject line with a period

- **Keep it Concise**: Aim for 50 characters or less. This limitation forces you to summarize the change succinctly.
- **Use the Imperative Mood**: Write as if commanding the codebase to change. Phrases like "Fix bug" or "Add feature" keep messages clear and direct.
- **Capitalize the First Letter**: Start with a capital letter, but avoid ending with a period; the subject line is a title, not a sentence.

## 2. The Body

Use the body to explain what and why you have done something. In most cases, you can leave out details about how a change has been made.

Example:
git commit -m "Short, descriptive title" -m "Detailed message explaining the reasoning, any challenges faced, and potential implications."


- **Explain the "Why"**: The subject line tells what was done; the body should explain why it was necessary. Provide context that couldn't fit in the subject.
- **Make it Readable**: Use complete sentences and proper punctuation. Bullet points can help list changes or important points.
- **Include References**: If the commit is related to issue tracker IDs or relevant URLs, list them here to create connections.

## 3. The Footer

- **Link Issues**: Use the footer to reference related issues or pull requests. Phrases like "Closes #123" automatically link commits to issues in platforms like GitHub.
- **Breaking Changes**: If your change is breaking, highlight it here. Begin with a label like "BREAKING CHANGE:" and describe the impact and migration path.

# Atomic commits

An atomic commit means that a single commit represents only one particular change. This doesn’t mean only one file or even one line changed, but rather one “logical” change. Atomic commits make it easier to understand changes, debug issues, and identify potential problems.

Recommendations:
Before committing, review changes with git diff.
If changes cover multiple areas or features, consider staging chunks or individual files with git add -p or git add <filename>.

# Use Commit Hooks for Standards
Git provides hooks – scripts that can run automatically before or after key events like commits, pushes, etc. You can set up a pre-commit hook to ensure commit messages adhere to a certain format or standard.

Recommendations:
Explore tools like commitlint or pre-commit to automate checks and standards for your commit messages.


# Include Tests in Commits

Whenever you’re adding a new feature or fixing a bug, it’s a good practice to include tests verifying that your changes work as intended. This ensures that future changes won’t unintentionally break your code.

Recommendations:
Commit tests in the same commit as the code changes. This way, if you or anyone else needs to rollback, the tests get rolled back too.

# Avoid Committing Generated Files

Files that are generated by build tools, compilers, or other automated processes should not typically be committed because they can be regenerated from source files. For instance, minified JavaScript files or compiled binaries.

Use a .gitignore file to specify and exclude automatically generated files.

# Intention

Commit messages shouldn't be larger than a tweet. Aim for 50 characters or less. This is a good practice because it forces you to be concise and to the point. If you need more space, you can always add a body to the commit message.

Capitalize the First Letter: Start with a capital letter, but avoid ending with a period; the subject line is a title, not a sentence

I always start with a verb in the imperative mood.
I always end with a period.
Add a blank line separating the summary from the body (unless you omit the body entirely).


# Signed Commits

Signed commits are changes submitted to a repository with a digital signature attached. This signature is created using the private key of a Public Key Infrastructure (PKI) belonging to the author of the commit. Anyone with the corresponding public key can verify the signature, ensuring the commit was indeed made by the holder of the private key and has not been tampered with since it was signed.

## Why are Signed Commits Important?

1. **Authentication**: Signed commits verify the identity of the committer, ensuring that the changes come from a known, trusted source.
2. **Integrity**: They guarantee that the commit hasn't been altered after being signed, safeguarding the code from unauthorized modifications.
3. **Trust**: In open-source projects or team environments, signed commits build trust among contributors by providing a verifiable trail of who did what.

# Practical Application of Signed Commits

Implementing signed commits involves generating a GPG (GNU Privacy Guard) or S/MIME (Secure/Multipurpose Internet Mail Extensions) key, configuring your version control system to use this key for signing commits, and then sharing your public key with others to verify your signed commits.

## Generating a GPG Key

1. **Installation**: Ensure GPG is installed on your system. It's available for Linux, macOS, and Windows.
2. **Key Generation**: Use the `gpg --gen-key` command to generate a new GPG key pair. During this process, you'll provide information like your name and email, which is used to identify the key.

## Configuring Git to Sign Commits

1. **Set GPG Key in Git**: Use the `git config` command to set your GPG key as the default signing key. For example: `git config --global user.signingkey YOUR_GPG_KEY_ID`.
2. **Signing Commits**: Add the `-S` flag to your `git commit` command to sign commits, e.g., `git commit -S -m "Your commit message"`.

## Sharing Your Public Key

For others to verify your signed commits, you need to share your public GPG key. You can add this key to platforms like GitHub, GitLab, or Bitbucket, where it will be used to automatically verify your signed commits.

## Verifying Signed Commits

To verify a signed commit, use the `git log --show-signature` command. This will display the commit information along with the verification status of the commit's signature.


# Autolink references

If the commit refers to an issue, add this information to the commit message header or body. e.g. the GitHub web platform automatically converts issue ids (e.g. #123) to links referring to the related issue.

---

Examples in title:

> [#123] Refer to GitHub issue…

> JIRA-123 Refer to Jira ticket with project identifier CAT… 
 
Examples in body:

> Fixes #123, #124


Assume you have configured an Autolink reference in your GitHub repository to link to issues in an external tracking system like JIRA.
You set up a reference pattern such as `JIRA-` followed by a number (e.g., `JIRA-123`).

Now, whenever someone mentions `JIRA-123` in a commit message, pull request description, or in issue comments, GitHub automatically converts `JIRA-123` into a clickable hyperlink. 
This link will lead directly to the corresponding issue `123` in the JIRA tracking system (assuming you've set up the URL pattern correctly to point to your JIRA instance).

Here's a breakdown of the setup steps in GitHub for Autolink references:

1. Go to your repository's settings.
2. Find the section named **Autolink references**.
3. Click **Add autolink reference**.
4. Enter the **Key Prefix** (e.g., `JIRA-`) and the **URL Template**, which is the URL pattern pointing to the external system with a placeholder for the issue number (e.g., `https://yourcompany.jira.com/browse/<num>` where `<num>` will be replaced with the issue number).

After this configuration, any mention of `JIRA-123` in the repository (within the scope of issues, pull requests, and commit messages) will automatically turn into a link that points to `https://yourcompany.jira.com/browse/123`.

# Gitmoji

# Best Practices for Commit Messages

- **Atomic Commits**: Each commit should represent a single logical change. This practice makes it easier to understand individual changes and revert them if necessary.
- **Review Before Committing**: Take a moment to review your changes and commit message. Ensure it accurately reflects the change and follows the guidelines.
- **Use a Consistent Style**: Whether it's the formatting of the message or the way you reference issues, consistency helps in maintaining readability.
- **Avoid Generic Messages**: Messages like "fix bug" or "update" are not helpful. Be specific about what was fixed or updated.

## Conclusion

Writing clean commit messages is a craft that benefits you and your team in the long run. It enhances collaboration, eases maintenance, and keeps the project history informative and navigable. By adhering to the guidelines outlined above, you'll contribute not just code, but clarity and understanding to your projects. Remember, a commit message is a reflection of your professionalism and attention to detail. Let's commit to excellence, one message at a time.


# Resources

- https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53
- https://wiki.openstack.org/wiki/GitCommitMessages#Information_in_commit_messages
- https://hashnode.com/post/which-commit-message-convention-do-you-use-at-work-ck3e4jbdd00zyo4s1h7mc7e0g
- https://training.github.com/downloads/github-git-cheat-sheet/
- https://engineeringfordatascience.com/posts/gitmoji/#:~:text=You%20can%20add%20emojis%20to,message%20summary%20%2D%20cool%2C%20right%3F
- https://github.com/joelparkerhenderson/git-commit-message

# Footnotes















