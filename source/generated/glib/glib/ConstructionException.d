module glib.ConstructionException;

private import glib.c.functions;
public  import glib.c.types;


/** */
/**
 * Exception class for construction errors
 */
class ConstructionException : Exception {
	this(string message) {
		super(message);
	}
}

/**
 */
