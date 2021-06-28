module pango.PgScript;

private import gobject.ObjectG;
private import pango.PgLanguage;
private import pango.c.functions;
public  import pango.c.types;


/** */
public struct PgScript
{

	/**
	 * Looks up the script for a particular character.
	 *
	 * The script of a character is defined by Unicode Standard Annex \#24.
	 * No check is made for @ch being a valid Unicode character; if you pass
	 * in invalid character, the result is undefined.
	 *
	 * Note that while the return type of this function is declared
	 * as `PangoScript`, as of Pango 1.18, this function simply returns
	 * the return value of g_unichar_get_script(). Callers must be
	 * prepared to handle unknown values.
	 *
	 * Deprecated: Use g_unichar_get_script()
	 *
	 * Params:
	 *     ch = a Unicode character
	 *
	 * Returns: the `PangoScript` for the character.
	 *
	 * Since: 1.4
	 */
	public static PangoScript scriptForUnichar(dchar ch)
	{
		return pango_script_for_unichar(ch);
	}

	/**
	 * Finds a language tag that is reasonably representative of @script.
	 *
	 * The language will usually be the most widely spoken or used language written
	 * in that script: for instance, the sample language for %PANGO_SCRIPT_CYRILLIC
	 * is ru (Russian), the sample language for %PANGO_SCRIPT_ARABIC is ar.
	 *
	 * For some scripts, no sample language will be returned because
	 * there is no language that is sufficiently representative. The
	 * best example of this is %PANGO_SCRIPT_HAN, where various different
	 * variants of written Chinese, Japanese, and Korean all use
	 * significantly different sets of Han characters and forms
	 * of shared characters. No sample language can be provided
	 * for many historical scripts as well.
	 *
	 * As of 1.18, this function checks the environment variables
	 * `PANGO_LANGUAGE` and `LANGUAGE` (checked in that order) first.
	 * If one of them is set, it is parsed as a list of language tags
	 * separated by colons or other separators. This function
	 * will return the first language in the parsed list that Pango
	 * believes may use @script for writing. This last predicate
	 * is tested using [method@Pango.Language.includes_script]. This can
	 * be used to control Pango's font selection for non-primary
	 * languages. For example, a `PANGO_LANGUAGE` enviroment variable
	 * set to "en:fa" makes Pango choose fonts suitable for Persian (fa)
	 * instead of Arabic (ar) when a segment of Arabic text is found
	 * in an otherwise non-Arabic text. The same trick can be used to
	 * choose a default language for %PANGO_SCRIPT_HAN when setting
	 * context language is not feasible.
	 *
	 * Params:
	 *     script = a `PangoScript`
	 *
	 * Returns: a `PangoLanguage` that is representative
	 *     of the script, or %NULL if no such language exists.
	 *
	 * Since: 1.4
	 */
	public static PgLanguage scriptGetSampleLanguage(PangoScript script)
	{
		auto __p = pango_script_get_sample_language(script);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgLanguage)(cast(PangoLanguage*) __p, true);
	}
}
