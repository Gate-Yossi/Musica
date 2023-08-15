<?php

class Mailer
{
    public function mail($recipient, $content)
    {
        echo sprintf('%s : %s', $recipient, $content);
    }
}