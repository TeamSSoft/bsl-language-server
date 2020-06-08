package com.github._1c_syntax.bsl.languageserver.providers;

import com.github._1c_syntax.bsl.languageserver.context.ServerContext;
import com.github._1c_syntax.utils.Absolute;
import org.eclipse.lsp4j.SymbolKind;
import org.eclipse.lsp4j.WorkspaceSymbolParams;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static com.github._1c_syntax.bsl.languageserver.util.TestUtils.PATH_TO_METADATA;
import static org.assertj.core.api.Assertions.assertThat;

class SymbolProviderTest {

  private ServerContext context;

  @BeforeEach
  private void before() {
    var configurationRoot = Absolute.path(PATH_TO_METADATA);
    context = new ServerContext(configurationRoot);
    context.populateContext();
  }

  @Test
  void getSymbols() {

    // given
    var params = new WorkspaceSymbolParams();

    // when
    var symbols = SymbolProvider.getSymbols(context, params);

    // then
    assertThat(symbols)
      .hasSizeGreaterThan(0)
      .anyMatch(symbolInformation ->
        symbolInformation.getName().equals("НеУстаревшаяПроцедура")
          && symbolInformation.getLocation().getUri().contains("ПервыйОбщийМодуль")
          && symbolInformation.getKind() == SymbolKind.Method
          && !symbolInformation.getDeprecated()
      )
      .anyMatch(symbolInformation ->
        symbolInformation.getName().equals("НеУстаревшаяПроцедура")
          && symbolInformation.getLocation().getUri().contains("РегистрСведений1")
          && symbolInformation.getKind() == SymbolKind.Method
          && !symbolInformation.getDeprecated()
      )
      .anyMatch(symbolInformation ->
        symbolInformation.getName().equals("УстаревшаяПроцедура")
          && symbolInformation.getLocation().getUri().contains("ПервыйОбщийМодуль")
          && symbolInformation.getKind() == SymbolKind.Method
          && symbolInformation.getDeprecated()
      )
      .anyMatch(symbolInformation ->
        symbolInformation.getName().equals("ВалютаУчета")
          && symbolInformation.getLocation().getUri().contains("ManagedApplicationModule")
          && symbolInformation.getKind() == SymbolKind.Variable
          && !symbolInformation.getDeprecated()
      )
    ;
  }

  @Test
  void getSymbolsQueryString() {

    // given
    var params = new WorkspaceSymbolParams("НеУстар");

    // when
    var symbols = SymbolProvider.getSymbols(context, params);

    // then
    assertThat(symbols)
      .hasSize(4)
      .anyMatch(symbolInformation ->
        symbolInformation.getName().contains("НеУстаревшаяПроцедура")
          && symbolInformation.getKind() == SymbolKind.Method
      )
    ;
  }

  @Test
  void getSymbolsQueryStringAllSymbols() {

    // given
    var params = new WorkspaceSymbolParams(".*");

    // when
    var symbols = SymbolProvider.getSymbols(context, params);

    // then
    assertThat(symbols)
      .hasSizeGreaterThan(0)
    ;
  }

  @Test
  void getSymbolsQueryStringErrorRegex() {

    // given
    var params = new WorkspaceSymbolParams("\\");

    // when
    var symbols = SymbolProvider.getSymbols(context, params);

    // then
    assertThat(symbols)
      .hasSize(0)
    ;
  }


}