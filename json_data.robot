*** Settings ***
Library  Collections

*** Variables ***
${js_string}=    {
...                  "random": {
...                       "passwd_change_date": "2016-12-16T11:26:26",
...                       "passwd_fail_count": 0,
...                       "password": "123456789",
...                       "status": 0,
...                       "user_name": "test@test.com",
...                       "processVariables": {
...                          "processKey": "modelTest",
...                          "Years": "2018"
...                  }
...                }
...              }

*** Test cases ***
Test Json data
    ${data} =    Evaluate    json.loads($js_string)    json        #แปลงข้อมูลจาก json string -> dictionary   การเข้าถึงข้อมูล
    Log To Console    \n${data["random"]}\n                        #เข้าถึงข้อมูล ทั้งหมดของ random
    Log To Console    \n${data["random"]["processVariables"]}\n    #เข้าถึงข้อมูล random -> processVariables
    Set To Dictionary    ${data["random"]["processVariables"]}    Years=2022    processKey = Automated   #ทำการแก้ไขข้อมูลของ Years,processKey 
    ${js_string} =    Evaluate    json.dumps($data)    json        # เก็บข้อมูลที่ได้จากการแปลง    แปลงจาก dic->json
    Log To Console    \n${js_string}\n
