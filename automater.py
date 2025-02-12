import FileHarvestor

if __name__ == '__main__':
    FileHarvestor.read_files(file_list=[r'1_exploring_linux_namespaces\1_create_and_explore_namespace.sh',
                                        r'1_exploring_linux_namespaces\2_demo_namespace_creation.c',
                                        r'2_demo security features\1_automate_patch_application.sh',
                                        r'2_demo security features\2_policy_management_example.sh',
                                        r'3_evaluating security mechanisms\1_simulate_privilege_escalation_attempt.sh',
                                        r'3_evaluating security mechanisms\2_stress_test_for_namespaces.sh',
                                        r'4_containerization_demo\1_mini_container.c',
                                        r'4_containerization_demo\2_docker_container_demo.sh',
                                        ])
