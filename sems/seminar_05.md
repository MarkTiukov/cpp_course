# Семинар 5

Этот семинар будет посвящен основам работы с git.

## Введение

- Что такое VCS
- Какие VCS бывают (в кратце)
- Что такое git и чем он отличается от GitHub (и GitLab)

## Основы работы с git

- git init
- Понятие worktree
- git checkout [path] для отката состояния файла
- Понятие staging area (индекса)
- git status
- git add
- git rm --cached
- Понятие ветки
- git checkout [branch]
- git checkout -b [branch]
- Понятие коммита
- git commit -m [msg]
- Почему commit-messages должны быть информативными
- git log (красивый вывод по веткам можно взять например [отсюда](https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs))

## Удаленный репозиторий

- Общая схема работы (1 удаленный репозиторий и много локальных)
- git remote add [slug] [url]
- git remote -v
- git clone (про ssh попозже)
- git che
- git pull 
- git fetch
- git push
- Что такое pull request (merge request)
- Опционально про merge веток (это если прям все понятно людям)

![img](https://miro.medium.com/max/481/0*h0aOKyXxUmlS-dIK.png)

## Конфигурация

- git config --global user.email (user.name)
- Что такое ssh (в общих словах)
- Клонирование через https vs ssh
- Настройка ssh в gitlab (лучше там, потому что домашки тоже будут там)
