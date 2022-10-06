<?php 

    Abstract class APIController extends Controller
    {
        protected function __construct()
        {
            $this->request = request();
            $this->inputs  = $this->getInputs();
        }

        final protected function getInputs($type = 'json-encoded') {
            $inputs = $this->request->inputs();
            if($type == 'json-encoded') {
                if(isset($inputs['postData'])) {
                    return json_decode($inputs['postData']);                    
                }
            }
            return $inputs;
        }

        final protected function json($data, $success = true, $message = "no message") {
            // header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'data' => $data,
                'success' => true,
                'message' => $message
            ]);
            return;
        }
        
        final protected function toJson($data) {
            return json_encode($data);
        }

        final protected function decodeJson($data) {
            return json_decode($data);
        }

    
        
        final protected function isPost() {
            if(isSubmitted()) 
                return true;

            return $this->json([
                'error' => TRUE,
                'message' => 'INVALID REQUEST!'
            ]);
        }

        final protected function validateAppUser($secret = null) {
            return true;
            if(is_null($secret)) {
                if (!isset($this->inputs['appKey'])) {
                    $this->json([
                        'error' => TRUE,
                        'message' => 'appKey is not set'
                    ]);
                    die();
                } else {
                    $this->validateAppUserKey($this->inputs['appKey']);
                }
            } else {
                $this->validateAppUserKey($secret);  
            }

            return true;
        }

        final protected function validateAppUserKey($secret) {
            // if(!isEqual($secret, APP_KEY)) {
            //     $this->json([
            //         'error' => TRUE,
            //         'message' => 'INVALID APP USER'
            //     ]);
            //     die();
            // }
        }

    }