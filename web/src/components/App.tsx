import React, { useState } from "react";
import { debugData } from "../utils/debugData";
import { Card, Image, ActionIcon, Group } from "@mantine/core";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { IconSquareXFilled } from '@tabler/icons-react';
import { fetchNui } from "../utils/fetchNui";
import { useVisibility } from "../providers/VisibilityProvider";

interface DocumentData {
  url: string;
  author: number;
}

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

debugData([
  {
    action: "sendDocument",
    data: [
      {
        url: 'https://www.krysztaly.pl/wp-content/uploads/2023/05/placeholder-1.png',
        author: 44
      }
    ],
  },
]);

const App: React.FC = () => {
  const [documentData, setDocumentData] = useState<DocumentData[]>([]);
  const { setVisible } = useVisibility();

  useNuiEvent('sendDocument', (data: DocumentData[]) => {
    setDocumentData(data);
  });

  const handleClose = () => {
    setVisible(false);
    fetchNui("hideFrame");
  };

  return (
    <div className="nui-wrapper">
      <Card withBorder maw={'90vw'} mah={'90vh'} >
        <Group justify="flex-end" mb={'xs'}>
          <ActionIcon variant="subtle" color="gray" onClick={handleClose}>
            <IconSquareXFilled stroke={1.5} />
          </ActionIcon>
        </Group>
        {documentData.length > 0 && (
          <Image
            radius="sm"
            fit="contain"
            src={documentData[0].url}
            mah={'70vh'}
          />
        )}
      </Card>
    </div>
  );
};

export default App;