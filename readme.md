# GithubAPI Test Project with Robot Framework

This project is used to automation test using GithubAPI with Robot Framework.


## Dependencies

#### Install the items

1. Visual Code + extension - Robot Framework Language Server
2. Python 3 or above


---

## Run Tests:

#### To download, get clone this project to your computer and execute the commands bellow:

1. Open project with Visual Code.
2. Run test with compiler or execute commands on Visual Code terminal.

```bash
robot -d ./logs api/tests/getUserTest.robot
```

```bash
robot -d ./logs api/tests/getIssureTest.robot
```

```bash
robot -d ./logs -i reactions api/tests/postReactionTest.robot
```

3. Access on project '.logs/report.html' and open Chrome browser to see results.


---

## IMPORTANT

* Before run the tests you need to install on terminal:

```bash
pip3 install robotframework-requests
```
