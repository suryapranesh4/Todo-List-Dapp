//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool isCompleted;
    }

    mapping(uint => Task) public tasks;

    constructor() public {
        createTask("The first to-do-item");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory selectedTask = tasks[_id];
        selectedTask.isCompleted = !selectedTask.isCompleted;
        tasks[_id] = selectedTask;
    }
}
