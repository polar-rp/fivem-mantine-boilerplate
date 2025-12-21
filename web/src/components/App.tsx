import React, { useState } from "react";
import { debugData } from "../utils/debugData";
import { Paper, Text, Button, Stack, Group, ActionIcon } from "@mantine/core";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { IconX } from "@tabler/icons-react";
import { fetchNui } from "../utils/fetchNui";
import { useVisibility } from "../providers/VisibilityProvider";

interface UIData {
  title?: string;
  message?: string;
}

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

debugData(
  [
    {
      action: "setData",
      data: {
        title: "Witaj w Boilerplate",
        message: "To jest przykładowe UI zbudowane z Mantine",
      },
    },
  ],
  1100
);

const App: React.FC = () => {
  const [data, setData] = useState<UIData>({
    title: "Przykładowy tytuł",
    message: "Przykładowa wiadomość",
  });
  const { setVisible } = useVisibility();

  useNuiEvent("setData", (receivedData: UIData) => {
    setData(receivedData);
  });

  const handleClose = () => {
    setVisible(false);
    fetchNui("hideFrame");
  };

  const handleSubmit = () => {
    fetchNui("submitData", {
      action: "example_action",
      timestamp: Date.now(),
    });
    handleClose();
  };

  return (
    <div className="nui-wrapper">
      <Paper shadow="xl" p="sm" w={400} withBorder>
        <Stack gap="md">
          <Group justify="space-between" mb="xs">
            <Text size="xl" fw={700}>
              {data.title}
            </Text>
            <ActionIcon variant="subtle" color="gray" onClick={handleClose}>
              <IconX size={20} />
            </ActionIcon>
          </Group>

          <Text size="sm" c="dimmed">
            {data.message}
          </Text>

          <Group justify="flex-end" mt="md">
            <Button variant="light" onClick={handleClose}>
              Anuluj
            </Button>
            <Button onClick={handleSubmit}>Zatwierdź</Button>
          </Group>
        </Stack>
      </Paper>
    </div>
  );
};

export default App;
