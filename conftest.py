import pytest

@pytest.fixture(scope="session")
def start():
    print("打开首页")
    return "yoyo"

@pytest.fixture(scope="session")
def login():
    print("====登录功能，返回账号，token===")
    name = "testyy"
    token = "npoi213bn4"
    yield name, token
    print("====退出登录！！！====")