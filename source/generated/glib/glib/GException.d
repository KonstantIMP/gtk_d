module glib.GException;

private import glib.ErrorG;
private import glib.Str;
private import glib.c.functions;
public  import glib.c.types;


/** */
/**
 * Class for representing GException as D std exception
 */
class GException : Exception {
	ErrorG error;

	this(ErrorG error) {
		super( Str.toString(error.getErrorGStruct().message) );
		this.error = error;
	}
}

/**
 */
