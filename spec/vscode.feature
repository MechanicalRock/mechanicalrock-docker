Feature: vscode

  Rules:
   - Configuration is maintained across runs
   - Command can be run from any directory
   - Single files can be opened
   - Directories can be opened
   - You don't need to be in the directory containing a files
   - Multiple workspaces are supported


  Background:  
    Given the directory structure:
    '''
      ./test-app1/foo.txt
      ./test-app1/bar.txt
      ./test-app2/baz.txt
      ./test-app2/bat.txt
    '''

  Scenario: Open VSCode in the current directory
    Given PWD is set to 'test-app1'
    When I run `vscode`
    Then the workspace should contain:
    '''
    foo.txt
    bar.txt
    '''
  
  Scenario: Open VSCode using a relative path
    Given PWD is set to 'test-app2'
    When I run `vscode ../test-app1`
    Then the workspace should contain:
    '''
    foo.txt
    bar.txt
    '''
  
  Scenario: Open a file
    Given PWD is set to 'test-app2'
    When I run `vscode ../test-app1/foo.txt`
    Then the workspace should contain:
    '''
    foo.txt
    bar.txt
    '''
    And 'foo.txt' should be open in the workspace

  Scenario: Configuration is retained between runs
    Given vscode has previously been configured with:
    '''
    {
      "editor.tabSize": 2,
      "editor.wordWrap": "on",
      "docker.attachShellCommand.linuxContainer": "/bin/bash",
      "terminal.integrated.shell.linux": "bash",
      "terminal.integrated.rendererType": "dom",
      "explorer.confirmDelete": false
    }
    '''
    When I run `vscode`
    Then the settings should be re-loaded
  
  Scenario: Multiple workspaces are supported
    Given I have run `vscode ../test-app1`
    When I run `vscode ../test-app2`
    Then 2 instances of vscode should be running
    And the workspace for 'vscode ../test-app2' should contain: 
    '''
    baz.txt
    bat.txt
    '''