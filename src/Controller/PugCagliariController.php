<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PugCagliariController extends AbstractController
{

    public function HelloPug()
    {

        return $this->render('base.html.twig', [
            'message' => 'Benvenuto al...'
        ]);
    }


}