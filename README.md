Battleline Engine Docker Container
==================================

This project pulls the battleline engine and its dependencies into a docker container, which makes it easy to run the engine against others bots. 

Language Support
----------------

The docker container currently includes support for:

- Python 2.7 Applications
- JVM Applications

Running Your Bot
----------------

To run your bot simply create a folder that contains (a) your bot and (b) the ``run-command`` file. The ``run-command`` file tells the docker container how-to execute your bot.


For a scala project, your bot folder may look like:

```
.
├── battlebot.jar
└── run-command
```

For a scala project your ``run-command`` file might contain:

```bash
java -jar battlebot.jar
```

To run your bot against the supplied random bot, simply map your bot folder to the player 1 slot.

```bash
docker pull jonathanhood/battleline
docker run -it -v <path-to-bot-folder>:/home/battleline/player1 jonathanhood/battleline
```

To run against two supplied bots, map both bot folders to the player 1 and 2 slots in the container.

```bash
docker pull jonathanhood/battleline
docker run -it -v <path-to-bot-folder>:/home/battleline/player1 \
    -v <path-to-bot2-folder>:/home/battleline/player2 \
    jonathanhood/battleline
```

Building the Container
----------------------

This project supplies a Makefile to simplify the process of building and debugging the container. 

```bash
> make help
-------------------------------------------------------------------------------
  make build   --> Build a new container
  make run     --> Run the container
  make shell   --> Open a shell in the container
-------------------------------------------------------------------------------
```

Adding Language Support
-----------------------

To add support for you bot, simply update the Dockerfile to include your dependencies and issue a pull request.

