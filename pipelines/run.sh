apiVersion: tekton.dev/v1beta1
kind: PipelineRun
metadata:
  labels:
    reruns: api-testing-run
    tekton.dev/pipeline: api-testing
  name: api-testing-run
  namespace: tekton-pipelines
spec:
  params:
  - name: ENVS
    value: "BFSSERVER_PNHOSTURL=https://pnode.solarfs.io|BFSSERVER_HOSTURL=https://dev-wine-api.netwarps.com|SOLARCHAIN_INFRAHTTP=https://test-sct.netwarps.com|SOLARCHAIN_INFRAWEBSOCKET=https://test-sct.netwarps.com|SOLARCHAIN_NFTADDR=0xe24fbDc836441a99A6cabDFD0b86CAB0f2BE41A6|SOLARCHAIN_TOKENCOINADDR=0x93Ed02367fD3C30b34fD21DdED45E2A8170e31C3"
  - name: IMAGE_URL
    value: registry.example.com/nft/great-wall-wine-cellar-api-test
  - name: IMAGE_TAG
    value: v0.1.5
  - name: COMMAND
    value: ./great-wall-wine-cellar-api-test
  pipelineRef:
    name: api-testing
  serviceAccountName: default
  timeout: 1h0m0s
  podTemplate:
    imagePullSecrets:
      - name: registry-pld-cicd
