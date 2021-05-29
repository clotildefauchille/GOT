home: async (request, response) => {
    try {
        //on récupère tous les quizzes en base
        const quizzes = await Quiz.findAll({
            //on ajoute les infos de l'auteur grâce aux relations qu'on a définies
            include: 'author'
        });
        response.render('index', {
            quizzes
        });
    } catch (error) {
        console.log('Error in mainController', error);
    }

}