from locust import HttpLocust, TaskSet, between
import resource


resource.setrlimit(resource.RLIMIT_NOFILE, (9999, 9999))


def front(l):
        l.client.get('/')


def back(l):
    l.client.post('/back', {"name": "test"})


class UserBehavior(TaskSet):
    tasks = {front: 10, back: 1}


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    wait_time = between(5.0, 9.0)
