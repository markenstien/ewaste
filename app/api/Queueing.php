<?php 

	class Queueing extends Controller
	{

		public function waitingAndServing()
		{
			$this->model = model('QueueModel');

			$waitingAndServing = $this->model->getWaitingAndServing();

			echo json_encode($waitingAndServing);
		}
	}