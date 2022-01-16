*** Settings ***
Library		OperatingSystem
Library		String
Library     /Users/ayush/Desktop/tempWorkspace/robotTest/pythonHelper.py

***Variables***
${str}=		This\n
...			This is line1\n
...			This is somehow line2\n
...			THis is line number3 even bigger length

${strL}=     552

***Keywords***
Lines should be shorter than
	[Arguments]     ${string}   ${size_threshold}
    ${lines}=     Split to lines      ${string}
    ${long lines}=    Set Variable    0

    FOR     ${line}     IN      @{lines}
        ${len}=     Get Length      ${line}
        IF      ${len}>${size_threshold}
                log to console      ${line} has length greater than the size_threshold
                ${long lines}=      Evaluate    ${long lines}+1
        END
    END
    ${final value}=     convert to string       ${long lines}
    log to console     Count of Long Lines is ${final value}


***Test Cases***
This is test case 1
    [Tags]  Test1
    Lines should be shorter than  ${str}  ${strL}

This is test case 2
    [Tags]  Test2   PythonFile
    ${return value}=     py_lines_should_be_shorter_than     ${str}      ${strL}
    ${return value string}=     convert to string       ${return value}
    log to console      The python file returned the value ${return value string}

This is test case 3
    [Tags]  Test3
    fail    this was bound to fail