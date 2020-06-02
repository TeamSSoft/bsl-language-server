# Not recommended using of RollbackTransaction method (WrongUseOfRollbackTransactionMethod)

| Type | Scope | Severity | Activated<br/>by default | Minutes<br/>to fix | Tags |
| :-: | :-: | :-: | :-: | :-: | :-: |
| `Error` | `BSL` | `Critical` | `Yes` | `1` | `standard` |

<!-- Блоки выше заполняются автоматически, не трогать -->
## Description
<!-- Описание диагностики заполняется вручную. Необходимо понятным языком описать смысл и схему работу -->
When using transactions, it is necessary to provide for exception processing.
You should call at first RollbackTransaction method in Exception block, and then execute other actions if required.
## Examples
<!-- В данном разделе приводятся примеры, на которые диагностика срабатывает, а также можно привести пример, как можно исправить ситуацию -->
```
BeginTransaction();
Attempt
    CommitTransaction();
Exception
    WriteLogEvent(NStr("ru = 'OperationExecution'"),
EventLogLevel.Error,
        ,
        ,
        DetailedErrorPresentation(InformationAboutError()));
    RollbackTransaction();
    CallException; // there is external transaction
EndTry;
```
## Sources
<!-- Необходимо указывать ссылки на все источники, из которых почерпнута информация для создания диагностики -->

Source: [Transactions: rules of use:](https://support.1ci.com/hc/en-us/articles/360011121239-Transactions-rules-of-use)

## Snippets

<!-- Блоки ниже заполняются автоматически, не трогать -->
### Diagnostic ignorance in code

```bsl
// BSLLS:WrongUseOfRollbackTransactionMethod-off
// BSLLS:WrongUseOfRollbackTransactionMethod-on
```

### Parameter for config

```json
"WrongUseOfRollbackTransactionMethod": false
```